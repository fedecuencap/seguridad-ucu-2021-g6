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

//import java.util.List;
//
//import javax.servlet.http.HttpServletRequest;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.http.HttpStatus;
//import org.springframework.http.MediaType;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RestController;
//import org.springframework.web.multipart.MultipartFile;
//import org.springframework.web.util.UriComponentsBuilder;
//
//import uy.edu.ucu.seg.g6.common.Contexto;
//import uy.edu.ucu.seg.g6.common.Mensaje;
//import uy.edu.ucu.seg.g6.common.Mensaje.Severidad;
//import uy.edu.ucu.seg.g6.web.core.BaseController;

@RestController
@RequestMapping("/app/usuarios")
public class UsuariosController extends BaseController{

	private Logger LOGGER = LoggerFactory.getLogger(getClass());

	
	@RequestMapping(value = "/listado/", method = RequestMethod.GET)
	public ResponseEntity<List<UsuarioDto>> listadoDeUsuarios() {

		Contexto contexto = this.getContexto();

		try {
			List<UsuarioDto> listado = securityService.obtenerListadoUsuarios();
			if (listado == null) {
				contexto.agregarMensaje(Severidad.INFO, "No se ha encontrado un lote con el id ingresado.");
				return new ResponseEntity<List<UsuarioDto>>(HttpStatus.NO_CONTENT);
			} else {
				return new ResponseEntity<List<UsuarioDto>>(listado, HttpStatus.OK);
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			contexto.agregarMensaje(Severidad.ERROR, "Se ha producido un error en la búsqueda de lotes.");
			return new ResponseEntity<List<UsuarioDto>>(HttpStatus.NO_CONTENT);
		}
	}
//	
//	@RequestMapping(value = "/obtenerDetalleLote/", method = RequestMethod.GET)
//	public ResponseEntity<LoteDto> obtenerDetalleLote(@RequestParam(name = "id", required = true) Integer id) {
//
//		Contexto contexto = this.getContexto();
//
//		try {
//			LoteDto lote = businessFacade.findByIdDetalleLote(id);
//			if (lote == null || lote.getLoteId() == null) {
//				contexto.agregarMensaje(Severidad.INFO, 1, "No se ha encontrado un lote con el id ingresado.");
//				return new ResponseEntity<LoteDto>(HttpStatus.NO_CONTENT);
//			} else {
//				return new ResponseEntity<LoteDto>(lote, HttpStatus.OK);
//			}
//		} catch (Exception e) {
//			LOGGER.error(e.getMessage(), e);
//			contexto.agregarMensaje(Severidad.ERROR, 1, "Se ha producido un error en la búsqueda de lotes.");
//			return new ResponseEntity<LoteDto>(HttpStatus.NO_CONTENT);
//		}
//	}
//	
//
//	@RequestMapping(value = "/obtenerLotes", method = RequestMethod.GET)
//	public ResponseEntity<List<LoteDto>> obtenerLotes(@RequestParam(name = "estado", required = false) Integer estado) {
//
//		Contexto contexto = this.getContexto();
//		try {
//			List<LoteDto> lotes = businessFacade.findByParametersLote(estado);
//			if (lotes == null || lotes.isEmpty()) {
//				contexto.agregarMensaje(Severidad.INFO, 1, "No se han encontrado resultados.");
//				return new ResponseEntity<List<LoteDto>>(HttpStatus.NO_CONTENT);
//			}
//			return new ResponseEntity<List<LoteDto>>(lotes, HttpStatus.OK);
//
//		} catch (Exception e) {
//			LOGGER.error("Error while getting lots", e);
//			contexto.agregarMensaje(Severidad.INFO, 1, "No se han encontrado resultados.");
//			return new ResponseEntity<List<LoteDto>>(HttpStatus.NO_CONTENT);
//		}
//	}
//
//	@RequestMapping(value = "/cargarLote/", method = RequestMethod.POST, consumes = MediaType.ALL_VALUE)
//	public void cargarLote(@RequestParam(name = "archivoCsv", required = false) MultipartFile archivo,
//			HttpServletRequest request, UriComponentsBuilder ucBuilder) {
//
//		Contexto contexto = this.getContexto();
//
//		try {
//			String fchInicio = request.getParameter("fchInicio");
//			String observaciones = request.getParameter("observaciones");
//
//			LoteDto lote = new LoteDto();
//
//			lote.setFchInicioStr(fchInicio);
//			lote.setObservaciones(observaciones);
//			lote.setArchivo(archivo.getBytes());
//			lote.setArchivoMulti(archivo);
//
//			lote.setUsuarioCarga(contexto.getUsername());
//			LOGGER.info("WSO2 - Sending lot of messages " + lote);
//
//			Mensaje mensaje = businessFacade.saveLote(contexto, lote);
//
//			contexto.agregarMensaje(mensaje.getSeveridad(), mensaje.getCodigo(), mensaje.getDescripcion());
//
//		} catch (Exception e) {
//			LOGGER.error(e.getMessage(), e);
//			contexto.agregarMensaje(Severidad.ERROR, 1, "Se ha producido un error al cargar el lote de SMS");
//		}
//
//	}

}
