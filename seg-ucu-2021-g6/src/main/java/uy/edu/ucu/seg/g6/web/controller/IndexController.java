package uy.edu.ucu.seg.g6.web.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import uy.edu.ucu.seg.g6.common.Contexto;
import uy.edu.ucu.seg.g6.common.UsuarioDto;
import uy.edu.ucu.seg.g6.web.model.LoginViewModel;
import uy.edu.ucu.seg.g6.web.model.RegistroViewModel;

@Controller
@RequestMapping("/app")
public class IndexController extends BaseController{

	@RequestMapping(method = RequestMethod.GET, value = "/login")
	public ModelAndView getLogin(@CookieValue(value = "sec-auth-sessionid",required = false) String uuid, HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(uuid != null && !uuid.isEmpty()) {
			Cookie cookie = new Cookie("sec-auth-sessionid", uuid);
			cookie.setHttpOnly(true);
			cookie.setMaxAge(0);
			cookie.setPath("/");
			request.getSession(true);
			response.addCookie(cookie);
		}
		return new ModelAndView("/login", "loginViewModel", new LoginViewModel());
	}

	@RequestMapping(method = RequestMethod.POST, value = "/login")
	public String postLogin(HttpSession session, @ModelAttribute LoginViewModel loginViewModel, HttpServletResponse response) throws Exception {
		if(this.securityService.autenticar(loginViewModel.getUsername(), loginViewModel.getPassword(), this.getContexto())) {
			String uuid = this.securityService.crearSesion(loginViewModel.getUsername());
			Cookie cookie = new Cookie("sec-auth-sessionid", uuid);
			cookie.setHttpOnly(true);
			cookie.setMaxAge(1800);
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/app/index";
		}else {
			return "login";
		}
	}
	
	// Pagina principal
	@RequestMapping(value="/index", method = RequestMethod.GET)
	public String getIndexPage(Model model) throws Exception {
		Contexto contexto = this.getContexto();
		model.addAttribute("userName", contexto.getUsername());
		return "index";
	}
	
	@RequestMapping(method = RequestMethod.POST, value = "/logout")
	public String postLogout(HttpSession session, @CookieValue(value = "sec-auth-sessionid",required = true) String uuid, HttpServletResponse response) throws Exception {
		Cookie cookie = new Cookie("sec-auth-sessionid", uuid);
		cookie.setHttpOnly(true);
		cookie.setMaxAge(0);
		response.addCookie(cookie);
		session.invalidate();
		return "redirect:/app/login";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/registro")
	public ModelAndView getRegistro(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("auto-registro", "registroViewModel", new RegistroViewModel());
	}

	@RequestMapping(method = RequestMethod.POST, value = "/registro")
	public String postRegistro(HttpSession session, @ModelAttribute RegistroViewModel registroViewModel, HttpServletResponse response) throws Exception {
		UsuarioDto usuario = new UsuarioDto();
		usuario.setConfirmPassword(registroViewModel.getConfirmPassword());
		usuario.setEmail(registroViewModel.getEmail());
		usuario.setFnac(LocalDate.parse(registroViewModel.getFnac(), DateTimeFormatter.ofPattern("dd/MM/yyyy")));
		usuario.setNombre(registroViewModel.getNombre());
		usuario.setPassword(registroViewModel.getPassword());
		usuario.setUact(registroViewModel.getUsername());
		usuario.setUsername(registroViewModel.getUsername());
		if(securityService.crearUsuario(usuario, this.getContexto())) {
			return "auto-registro-confirmar";
		}else {
			return "auto-registro";
		}
	}

	@RequestMapping(method = RequestMethod.POST, value = "/confirmar-registro")
	public String postConfirmarRegistro(HttpSession session, @ModelAttribute RegistroViewModel registroViewModel, HttpServletResponse response) throws Exception {
		if(securityService.confirmarRegistro(registroViewModel.getUsername(), registroViewModel.getCodigo(), this.getContexto())) {
			return "redirect:/app/login";
		}else {
			return "auto-registro-confirmar";
		}
	}

	
	@RequestMapping(method = RequestMethod.GET, value = "/usuarios")
	public ModelAndView listadoUsuarios(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("usuario-listado");
	}

	@RequestMapping(method = RequestMethod.GET, value = "/403")
	public ModelAndView get403(HttpServletRequest request, HttpServletResponse response) throws Exception {
		return new ModelAndView("403");
	}

}