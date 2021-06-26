package uy.edu.ucu.seg.g6.business.entities;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;


@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
@ToString(callSuper = true)
@Entity
@Table(name = "usuario")
public class Usuario implements Serializable {
	
	private static final long serialVersionUID = 637075080680234345L;

	@Id	
	@Column(name = "username", length = 50, nullable = false)
	@EqualsAndHashCode.Include private String username;

	@Column(name = "nombre", length = 100, nullable = true)
	private String nombre;

	@Column(name = "email", length = 100, nullable = true)
	private String email;

	@Column(name = "fnac", nullable = false)
	private LocalDate fnac;

	@Column(name = "salt", length = 50, nullable = true)
	private String salt;

	@Column(name = "password", length = 100, nullable = true)
	private String password;
	
	@Column(name = "fbaja", nullable = true)
	private LocalDateTime fbaja;

	@Column(name = "uact", length = 50, nullable = false)
	private String uact;

	@Column(name = "fact", nullable = false)
	private LocalDateTime fact;
}

