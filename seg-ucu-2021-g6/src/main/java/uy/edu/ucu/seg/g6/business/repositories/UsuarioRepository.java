package uy.edu.ucu.seg.g6.business.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;

import uy.edu.ucu.seg.g6.business.entities.Usuario;

public interface UsuarioRepository extends JpaRepositoryImplementation<Usuario, String>  {
	
	
	@Query(value = "SELECT u from Usuario u where u.fbaja is null")
	public List<Usuario> obtenerListadoUsuarios();

}
