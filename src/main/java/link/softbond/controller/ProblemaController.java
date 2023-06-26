package link.softbond.controller;

import link.softbond.entities.Problema;
import link.softbond.repositorios.ProblemaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/problemas")
public class ProblemaController {

    @Autowired
    ProblemaRepository problemaRepository;

    @GetMapping("/list/activos")
    public List<Problema> listarProblemasActivos(@RequestParam("estado") Integer estado){
        return problemaRepository.findByEstado(estado);
    }
	
}
