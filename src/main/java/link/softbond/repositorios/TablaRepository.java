package link.softbond.repositorios;

import link.softbond.entities.Problema;
import org.springframework.data.jpa.repository.JpaRepository;

import link.softbond.entities.Tabla;

import java.util.List;

public interface TablaRepository extends JpaRepository<Tabla,Integer>{
    List<Tabla> findByProblema(Problema problema);
}
