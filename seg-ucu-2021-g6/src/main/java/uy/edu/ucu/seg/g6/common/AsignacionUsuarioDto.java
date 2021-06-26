package uy.edu.ucu.seg.g6.common;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class AsignacionUsuarioDto implements Serializable {
	
	private static final long serialVersionUID = 637075178808093028L;

	private Long asigusuid;

	private UsuarioDto usuario;

	private RolDto rol;

	private Date fbaja;

	private String uact;

	private LocalDateTime fact;

}
