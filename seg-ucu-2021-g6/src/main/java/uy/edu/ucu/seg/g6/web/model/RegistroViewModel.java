package uy.edu.ucu.seg.g6.web.model;

import lombok.Data;

@Data
public class RegistroViewModel {

	private String username;

	private String nombre;

	private String email;

	private String fnac;

	private String salt;

	private String password;

	private String confirmPassword;
	
	private String codigo;
}
