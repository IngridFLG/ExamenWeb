package link.softbond.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import link.softbond.entities.Problema;
import link.softbond.repositorios.ProblemaRepository;

@RestController
@RequestMapping("/problemas")
public class ProblemaController {

    @Autowired
    ProblemaRepository problemaRepository;





    
    @GetMapping("/list")
    public List<Problema> listarProblemas(){
        return problemaRepository.findAll();
    }
	
}
