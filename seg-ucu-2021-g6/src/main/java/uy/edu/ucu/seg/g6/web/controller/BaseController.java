package uy.edu.ucu.seg.g6.web.controller;

import javax.servlet.http.HttpSession;

import org.apache.logging.log4j.ThreadContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.google.gson.Gson;

import uy.edu.ucu.seg.g6.business.services.SecurityService;
import uy.edu.ucu.seg.g6.common.Contexto;

public abstract class BaseController {

	@Autowired
	protected SecurityService securityService;
	
	protected Contexto getContexto() {
		String jsonContexto = ThreadContext.get("sec-auth-context");
		Gson gson = new Gson();
		
		Contexto contexto = gson.fromJson(jsonContexto, Contexto.class);
		if(contexto == null) {
			contexto = new Contexto();
		}
		contexto.setSession(getSession());
		return contexto;
	}
	
	protected HttpSession getSession(){
		HttpSession sesion = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest().getSession();
		return sesion ;
	}
}
