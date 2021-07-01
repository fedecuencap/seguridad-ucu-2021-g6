package uy.edu.ucu.seg.g6.web.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import uy.edu.ucu.seg.g6.common.Contexto;
import uy.edu.ucu.seg.g6.common.Mensaje.Severidad;
import uy.edu.ucu.seg.g6.common.UsuarioDto;

@RestController
@RequestMapping("/api/usuarios")
public class UsuariosController extends BaseController{

	private Logger LOGGER = LoggerFactory.getLogger(getClass());

	
	@RequestMapping(value = "/listado/", method = RequestMethod.GET)
	public ResponseEntity<List<UsuarioDto>> listadoDeUsuarios() {

		Contexto contexto = this.getContexto();

		try {
			List<UsuarioDto> listado = securityService.obtenerListadoUsuarios();
			if (listado == null) {
				contexto.agregarMensaje(Severidad.INFO, "No se encontraron usuarios");
				return new ResponseEntity<List<UsuarioDto>>(HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<List<UsuarioDto>>(listado, HttpStatus.OK);
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			contexto.agregarMensaje(Severidad.ERROR, "Se ha producido un error en la búsqueda de usuarios");
			return new ResponseEntity<List<UsuarioDto>>(HttpStatus.NO_CONTENT);
		}
	}
}
