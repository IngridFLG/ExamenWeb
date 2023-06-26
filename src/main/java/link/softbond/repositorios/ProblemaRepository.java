package link.softbond.repositorios;

import org.springframework.data.jpa.repository.JpaRepository;

import link.softbond.entities.Problema;

import java.util.List;

public interface ProblemaRepository extends JpaRepository<Problema,Integer>{
    List<Problema> findByEstado(Integer estado);
}
