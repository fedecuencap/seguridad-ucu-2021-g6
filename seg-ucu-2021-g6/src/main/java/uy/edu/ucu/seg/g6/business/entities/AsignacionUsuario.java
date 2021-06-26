package uy.edu.ucu.seg.g6.business.entities;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
@ToString(callSuper = true)
@Entity
@Table(name = "asignacion_usuario")
public class AsignacionUsuario implements Serializable {
	
	private static final long serialVersionUID = 637075178808093028L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "asigusuid", nullable = false)
	@EqualsAndHashCode.Include private Long asigusuid;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "username", nullable = false)
	private Usuario usuario;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "rolname", nullable = false)
	private Rol rol;

	@Column(name = "fbaja", nullable = true)
	private Date fbaja;

	@Column(name = "uact", length = 50, nullable = false)
	private String uact;

	@Column(name = "fact", nullable = false)
	private LocalDateTime fact;

}
