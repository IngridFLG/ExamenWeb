package link.softbond.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import link.softbond.entities.Examen;

public interface ExamenRepository extends JpaRepository<Examen,Integer>{
    
}
