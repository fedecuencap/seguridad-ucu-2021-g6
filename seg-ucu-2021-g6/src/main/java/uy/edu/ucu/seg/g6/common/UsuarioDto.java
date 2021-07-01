package uy.edu.ucu.seg.g6.common;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;


@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
public class UsuarioDto implements Serializable {
	
	private static final long serialVersionUID = 637075080680234345L;

	private String username;

	private String nombre;

	private String email;

	private LocalDate fnac;

	private String salt;

	private String password;

	private String confirmPassword;

	private String uuidactivacion;

	private LocalDateTime factivacion;

	private LocalDateTime fcrea;

	private LocalDateTime fbaja;

	private String uact;

	private LocalDateTime fact;
}

