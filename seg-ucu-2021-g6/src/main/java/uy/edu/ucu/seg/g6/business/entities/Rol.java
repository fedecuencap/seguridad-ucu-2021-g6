package uy.edu.ucu.seg.g6.business.entities;

import java.io.Serializable;
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
@Table(name = "rol")
public class Rol implements Serializable {
	
	private static final long serialVersionUID = 637075080680234345L;

	@Id	
	@Column(name = "rolname", length = 50, nullable = false)
	@EqualsAndHashCode.Include private String rolname;

	@Column(name = "nombre", length = 100, nullable = true)
	private String nombre;
	
	@Column(name = "fbaja", nullable = true)
	private LocalDateTime fbaja;

	@Column(name = "uact", length = 50, nullable = false)
	private String uact;

	@Column(name = "fact", nullable = false)
	private LocalDateTime fact;

}

