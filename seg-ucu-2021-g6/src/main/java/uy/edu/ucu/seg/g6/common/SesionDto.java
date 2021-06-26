package uy.edu.ucu.seg.g6.common;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@EqualsAndHashCode(callSuper = false)
@ToString(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
public class SesionDto {

	private String uuid;
	
	private String username;

	private String roles;

	private LocalDateTime fechaCreacion;

	private LocalDateTime fechaUltimoAcceso;

}
