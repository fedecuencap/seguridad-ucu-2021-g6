package uy.edu.ucu.seg.g6.web.config;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.List;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.ThreadContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.web.filter.OncePerRequestFilter;
import org.springframework.web.util.WebUtils;

import com.google.gson.Gson;

import uy.edu.ucu.seg.g6.business.services.SecurityService;
import uy.edu.ucu.seg.g6.common.Contexto;
import uy.edu.ucu.seg.g6.common.SesionDto;

@Configuration
@Order(Ordered.HIGHEST_PRECEDENCE)
public class SecurityAuthFilter extends OncePerRequestFilter {


	private static final Logger logger = LoggerFactory.getLogger(SecurityAuthFilter.class.getName());

	private static final String SECURITY_COOKIE_NAME = "sec-auth-sessionid";
	
	@Autowired
	private SecurityService securityService;
	
	private List<String> publicRoutes = Arrays.asList("/app/login","/app/registro");
	private List<String> authenticatedRoutes = Arrays.asList("/app/index");
	private List<String> adminRoutes = Arrays.asList("/app/usuarios","/api/usuarios/listado/");
	
	
	@Override
	protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain)
			throws ServletException, IOException {
		try {
			String uri = request.getRequestURI();
			if(publicRoutes.contains(uri)) {
				//anonymus request
				//valid request
				filterChain.doFilter(request, response);
			}else if(authenticatedRoutes.contains(uri) || adminRoutes.contains(uri)){
				String cookie = getCookie(request);
				Contexto contexto = checkAuthenticated(request, cookie, uri);
				if(contexto != null) {
					if(adminRoutes.contains(uri)) {
						if(!checkIsAdmin(contexto)) {
							logger.error("Intento de acceso no autorizado, cookie " + cookie + ", uri " + uri);
							response.setStatus(403);
							response.sendRedirect("/app/403");
						}else {
							Gson gson = new Gson();
							ThreadContext.put("sec-auth-context", gson.toJson(contexto));
							filterChain.doFilter(request, response);
						}
					}else {
						Gson gson = new Gson();
						ThreadContext.put("sec-auth-context", gson.toJson(contexto));
						filterChain.doFilter(request, response);
					}
				}
			}else {
				//not page request
				filterChain.doFilter(request, response);
			}
		} catch (Exception e) {
			logger.error(e.getMessage(), e);
		}

	}

	private String getCookie(HttpServletRequest request) {
		Cookie cookie = WebUtils.getCookie(request, SECURITY_COOKIE_NAME);
		if (cookie != null) {
			return cookie.getValue();
		}
		return "";
	}
	
	private Contexto checkAuthenticated(HttpServletRequest request, String cookie, String uri) {
		logger.info("### inicio filtro authenticacion");
		if (!StringUtils.isBlank(cookie)) {
			SesionDto sesion = securityService.getSesion(cookie);
			if(sesion == null) {
				logger.error("Intento de acceso no autorizado, sesion null, cookie " + cookie + ", uri " + uri);
				return null;
			}else {
				if(LocalDateTime.now().isAfter(sesion.getFechaUltimoAcceso().plusMinutes(30))) {
					logger.error("Intento de acceso no autorizado, sesion vencida, " + cookie + ", " + uri + ", ultimo acceso: " + sesion.getFechaUltimoAcceso());
					return null;
				}else {
					Contexto contexto = new Contexto();
					contexto.setUsername(sesion.getUsername());
					contexto.setSession(request.getSession(false));
					contexto.setRoles(Arrays.asList(sesion.getRoles().split(",")));
					return contexto;
				}
			}
		}else {
			logger.error("Intento de acceso no autorizado, cookie null, " + uri);
			return null;
		}
	}
	
	private boolean checkIsAdmin(Contexto contexto) {
		return contexto.getRoles().contains("ROLE_ADMIN");
	}

}
