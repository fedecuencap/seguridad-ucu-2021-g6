package uy.edu.ucu.seg.g6.business.services;

import java.security.SecureRandom;
import java.security.spec.KeySpec;
import java.time.LocalDateTime;
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
import uy.edu.ucu.seg.g6.business.entities.Sesion;
import uy.edu.ucu.seg.g6.business.entities.Usuario;
import uy.edu.ucu.seg.g6.business.repositories.AsignacionUsuarioRepository;
import uy.edu.ucu.seg.g6.business.repositories.RolRepository;
import uy.edu.ucu.seg.g6.business.repositories.SesionRepository;
import uy.edu.ucu.seg.g6.business.repositories.UsuarioRepository;
import uy.edu.ucu.seg.g6.common.SesionDto;

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
	
	public boolean autenticar(String username, String password) throws Exception {
		Optional<Usuario> optUsuario = usuarioRepository.findById(username); 
		if(optUsuario.isPresent()) {
			String encripted = this.encript(password, optUsuario.get().getSalt());
			if(optUsuario.get().getPassword().equals(encripted)) {
				return true;
			}else {
				return false;
			}
		}else {
			return false;
		}
	}
	
	public boolean crearUsuario(String username, String nombre, String email, String password, String confirmPassword, String uact) throws Exception {
		
		if(password != null && password.equals(confirmPassword) && password.matches("^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=])(?=\\S+$).{8,}$")) {
			if(!usuarioRepository.existsById(username)) {
				String salt = generateSalt();
				Usuario usuario = new Usuario();
				usuario.setUsername(username);
				usuario.setNombre(nombre);
				usuario.setFact(LocalDateTime.now());
				usuario.setUact(uact);
				usuario.setSalt(salt);
				usuario.setPassword(encript(password, salt));
				usuarioRepository.save(usuario);
				return true;
			}else {
				return false;
			}
		}else {
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
	
	
}
