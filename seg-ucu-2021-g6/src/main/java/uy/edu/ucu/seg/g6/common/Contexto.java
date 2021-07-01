package uy.edu.ucu.seg.g6.common;

import static org.apache.commons.lang3.ArrayUtils.isEmpty;

import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import javax.servlet.http.HttpSession;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import uy.edu.ucu.seg.g6.common.Mensaje.Severidad;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Contexto {

	private String username;

	private String uuid;
	
	private List<String> roles;

	private transient HttpSession session;
	
	public Contexto(HttpSession session) { this.session = session; }
	
	@SuppressWarnings("unchecked")
	public void agregarMensaje(Severidad severidad, String descripcion, Object... parametros) {
		if(session != null) {
			Mensaje mensaje = new Mensaje();
			mensaje.setDescripcion(descripcion);
			mensaje.setSeveridad(severidad);
			if (!isEmpty(parametros)) {
				for (Object item : parametros) {
					mensaje.getParametros().add(item);
				}
			}
			
			Set<Mensaje> mensajes = null;
			String key = null;
			switch (mensaje.getSeveridad()) {
			case ERROR:
				key = "mensajesError";
				break;
			case WARNING:
				key = "mensajesWarning";
				break;
			case SUCCESS:
				key = "mensajesSuccess";
				break;
			case INFO:
				key = "mensajesInfo";
				break;
			default:
				key = "mensajesIndefinido";
				break;
			}

			mensajes = (Set<Mensaje>) session.getAttribute(key);
			if (mensajes == null || mensajes.isEmpty()) {
				mensajes = new TreeSet<Mensaje>();
			}
			mensajes.add(mensaje);
			session.setAttribute(key, mensajes);
		}
	}
}
