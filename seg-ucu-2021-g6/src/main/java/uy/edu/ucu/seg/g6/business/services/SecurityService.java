package uy.edu.ucu.seg.g6.business.services;

import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;
import java.util.UUID;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

import org.dozer.DozerBeanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import uy.edu.ucu.seg.g6.business.entities.AsignacionUsuario;
import uy.edu.ucu.seg.g6.business.entities.Rol;
import uy.edu.ucu.seg.g6.business.entities.Sesion;
import uy.edu.ucu.seg.g6.business.entities.Usuario;
import uy.edu.ucu.seg.g6.business.repositories.AsignacionUsuarioRepository;
import uy.edu.ucu.seg.g6.business.repositories.RolRepository;
import uy.edu.ucu.seg.g6.business.repositories.SesionRepository;
import uy.edu.ucu.seg.g6.business.repositories.UsuarioRepository;
import uy.edu.ucu.seg.g6.business.serviceagent.SendMailServiceAgent;
import uy.edu.ucu.seg.g6.common.Contexto;
import uy.edu.ucu.seg.g6.common.Mensaje.Severidad;
import uy.edu.ucu.seg.g6.common.SesionDto;
import uy.edu.ucu.seg.g6.common.UsuarioDto;

@Service
@Transactional
public class SecurityService {
	
	
	@Autowired
	private AsignacionUsuarioRepository asignacionUsuarioRepository;

	@Autowired
	private RolRepository rolRepository;

	@Autowired
	private SesionRepository sesionRepository;

	@Autowired
	private UsuarioRepository usuarioRepository;
	
	@Autowired
	private SendMailServiceAgent sendMailServiceAgent;

	@Autowired
	@Qualifier("mapper-factory")
	private DozerBeanMapper mapper;
	
	public SesionDto getSesion(String uuid) {
		if(sesionRepository.existsById(uuid)) {
			Sesion sesion = sesionRepository.getOne(uuid);
			SesionDto dto = mapper.map(sesion, SesionDto.class);
			return dto;
		}
		return null;
	}
	
	public String crearSesion(String username) {
		if(usuarioRepository.existsById(username)) {
			List<AsignacionUsuario> asignaciones = asignacionUsuarioRepository.findAllByUsuario(username);
			String roles = "";
			boolean hasRol = false;
			for(AsignacionUsuario a : asignaciones) {
				roles += a.getRol().getRolname() + ",";
				hasRol = true;
			}
			if(hasRol) {
				roles = roles.substring(0, roles.length() - 1);
			}
			Sesion sesion = new Sesion(UUID.randomUUID().toString(), username, roles, LocalDateTime.now(), LocalDateTime.now());
			sesionRepository.save(sesion);
			return sesion.getUuid();
		}
		return null;
	}
	
	public boolean autenticar(String username, String password, Contexto contexto) throws Exception {
		Optional<Usuario> optUsuario = usuarioRepository.findById(username); 
		if(optUsuario.isPresent()) {
			if(optUsuario.get().getFbaja() != null) {
				contexto.agregarMensaje(Severidad.ERROR, "Contactese con el administrador");
				return false;
			} else {
				String encripted = this.encript(password, optUsuario.get().getSalt());
				if(optUsuario.get().getPassword().equals(encripted)) {
				    if(optUsuario.get().getFactivacion() == null) {
						contexto.agregarMensaje(Severidad.ERROR, "Verifique su correo y siga las instrucciones");
						return false;
				    }
					return true;
				}else {
					contexto.agregarMensaje(Severidad.ERROR, "Usuario o password incorrectos");
					return false;
				}
			}
		}else {
			contexto.agregarMensaje(Severidad.ERROR, "Usuario o password incorrectos");
			return false;
		}
	}
	
	public boolean crearUsuario(UsuarioDto usuarioDto, Contexto contexto) throws Exception {
		String password = usuarioDto.getPassword();
		String confirmPassword = usuarioDto.getConfirmPassword();
		if(password != null && password.equals(confirmPassword) && password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$")) {
			if(!usuarioRepository.existsById(usuarioDto.getUsername())) {
				String salt = generateSalt();
				Usuario usuario = mapper.map(usuarioDto, Usuario.class);
				usuario.setFact(LocalDateTime.now());
				usuario.setSalt(salt);
				usuario.setPassword(encript(password, salt));
				usuario.setFactivacion(null);
				usuario.setUuidactivacion(UUID.randomUUID().toString());
				usuario.setFcrea(LocalDateTime.now());
				usuarioRepository.save(usuario);
				Optional<Rol> rol =rolRepository.findById("ROLE_SELF_REGISTER");
				if(rol.isPresent()) {
					AsignacionUsuario au = new AsignacionUsuario();
					au.setFact(LocalDateTime.now());
					au.setUsuario(usuario);
					au.setRol(rol.get());
					au.setUact(usuarioDto.getUsername());
					asignacionUsuarioRepository.save(au);
				}
				sendMailServiceAgent.sendEmail(usuario.getEmail(), "Bienvenido a Seg Ucu G6 2021", usuario.getUuidactivacion());
				contexto.agregarMensaje(Severidad.SUCCESS, "Revise su casilla de email e ingrese el codigo enviado para activar su cuenta");
				return true;
			}else {
				contexto.agregarMensaje(Severidad.ERROR, "Seleccione otro nombre de usuario");
				return false;
			}
		}else {
			contexto.agregarMensaje(Severidad.ERROR, "Seleccione una password que cumpla con los requisitos y verifique haberla ingresado correctamente las 2 veces");
			return false;
		}
	}
	
	public boolean confirmarRegistro(String username, String codigo, Contexto contexto) {
		Optional<Usuario> usuario = usuarioRepository.findById(username);
		if(usuario.isPresent()) {
			String uuid = usuario.get().getUuidactivacion();
			if(uuid.equals(codigo)) {
				Usuario usu = usuario.get();
				usu.setFactivacion(LocalDateTime.now());
				usuarioRepository.save(usu);
				contexto.agregarMensaje(Severidad.SUCCESS, "Usuario activado, ya puede ingresar al sistema");
				return true;
			}else {
				contexto.agregarMensaje(Severidad.ERROR, "Revise el codigo enviado a su correo y vuelva a ingresarlo");
				return false;
			}
		}else {
			contexto.agregarMensaje(Severidad.ERROR, "Ha ocurrido un error");
			return false;
		}
	}
	
	private String generateSalt() {
		SecureRandom random = new SecureRandom();
		byte[] salt = new byte[16];
		random.nextBytes(salt);
		return Base64.getEncoder().encodeToString(salt);
	}
	
	private String encript(String rawPassword, String salt) throws Exception {
		KeySpec spec = new PBEKeySpec(rawPassword.toCharArray(), Base64.getDecoder().decode(salt), 65536, 128);
		SecretKeyFactory factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
		byte[] hash = factory.generateSecret(spec).getEncoded();
		return Base64.getEncoder().encodeToString(hash);
	}
	
	
	public List<UsuarioDto> obtenerListadoUsuarios(){
		List<Usuario> usuarios = usuarioRepository.obtenerListadoUsuarios();
		List<UsuarioDto> response = new ArrayList<UsuarioDto>();
		for(Usuario u : usuarios) {
			response.add(mapper.map(u, UsuarioDto.class));
		}
		return response;
	}
	
	
}
