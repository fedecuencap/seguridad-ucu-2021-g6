package uy.edu.ucu.seg.g6.business.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;
import org.springframework.data.repository.query.Param;

import uy.edu.ucu.seg.g6.business.entities.AsignacionUsuario;

public interface AsignacionUsuarioRepository extends JpaRepositoryImplementation<AsignacionUsuario, Long> {

     @Query(value="SELECT au "
                + "FROM AsignacionUsuario au "
                + "INNER JOIN au.usuario usu "
                + "WHERE usu.username = :username ")
	public List<AsignacionUsuario> findAllByUsuario(@Param("username") String username);
}
