package uy.edu.ucu.seg.g6.business.repositories;

import org.springframework.data.jpa.repository.support.JpaRepositoryImplementation;

import uy.edu.ucu.seg.g6.business.entities.Sesion;

public interface SesionRepository extends JpaRepositoryImplementation<Sesion, String>  {
	
}
