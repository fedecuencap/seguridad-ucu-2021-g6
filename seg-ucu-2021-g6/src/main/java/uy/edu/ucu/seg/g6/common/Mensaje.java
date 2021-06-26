package uy.edu.ucu.seg.g6.common;

import java.util.ArrayList;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@EqualsAndHashCode
public class Mensaje implements Comparable<Mensaje>{
	
	public enum Severidad {
		INFO, WARNING, ERROR, SUCCESS
	}	

	private Integer codigo = 0;

	private Severidad severidad;

	private List<Object> parametros = new ArrayList<Object>();

	private String descripcion;

	public String getDescripcionFormateada() {
		if(parametros != null) {
			return String.format(descripcion, parametros.toArray());
		}else {
			return descripcion;
		}
	}
	
	public int compareTo(Mensaje o) {
		int compare = this.severidad.compareTo(o.getSeveridad()); 
		if(compare == 0) {
			compare = this.getCodigo().compareTo(o.getCodigo());
		}
		return compare;
	}
}
