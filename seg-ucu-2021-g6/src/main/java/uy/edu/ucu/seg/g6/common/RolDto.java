package uy.edu.ucu.seg.g6.common;

import java.io.Serializable;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;


@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class RolDto implements Serializable {
	
	private static final long serialVersionUID = 637075080680234345L;

	private String rolname;

	private String nombre;
	
	private LocalDateTime fbaja;

	private String uact;

	private LocalDateTime fact;

}

