package uy.edu.ucu.seg.g6.business.repositories;

import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;

import uy.edu.ucu.seg.g6.business.entities.Usuario;

public interface UsuarioRepository extends JpaRepositoryImplementation<Usuario, String>  {

}
