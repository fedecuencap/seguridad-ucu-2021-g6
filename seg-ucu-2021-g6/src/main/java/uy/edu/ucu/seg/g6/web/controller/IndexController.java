package uy.edu.ucu.seg.g6.web.controller;

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
import uy.edu.ucu.seg.g6.common.Mensaje.Severidad;
import uy.edu.ucu.seg.g6.web.model.LoginViewModel;

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
		if(this.securityService.autenticar(loginViewModel.getUsername(), loginViewModel.getPassword())) {
			String uuid = this.securityService.crearSesion(loginViewModel.getUsername());
			Cookie cookie = new Cookie("sec-auth-sessionid", uuid);
			cookie.setHttpOnly(true);
			cookie.setMaxAge(1800);
			cookie.setPath("/");
			response.addCookie(cookie);
			return "redirect:/app/index";
		}else {
			this.getContexto().agregarMensaje(Severidad.ERROR, 1, "Usuario o password incorrectos");
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

}