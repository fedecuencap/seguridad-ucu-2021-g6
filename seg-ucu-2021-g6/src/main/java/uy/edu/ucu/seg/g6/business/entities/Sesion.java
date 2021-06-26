package uy.edu.ucu.seg.g6.business.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(onlyExplicitlyIncluded = true, callSuper = false)
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "sesion")
public class Sesion {

	@Id	
	@Column(name = "uuid", length = 250, nullable = false)
	@EqualsAndHashCode.Include private String uuid;
	
	@Column(name = "username", length = 200, nullable = false)
	private String username;

	@Column(name = "roles", nullable = false)
	private String roles;

	@Column(name = "fcrea",  nullable = true)
	private LocalDateTime fechaCreacion;

	@Column(name = "flastaccess",  nullable = true)
	private LocalDateTime fechaUltimoAcceso;

}
