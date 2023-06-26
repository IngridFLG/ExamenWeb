package link.softbond.controller;


import link.softbond.entities.Consulta;
import link.softbond.entities.Problema;
import link.softbond.repositorios.ConsultaRepository;
import link.softbond.repositorios.ProblemaRepository;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
@RequestMapping("/problemas")
public class ProblemaController {


    @Autowired
    ProblemaRepository problemaRepository;

    @Autowired
    ConsultaRepository consultaRepository;


    @GetMapping("/list/activos")
    public List<Problema> listarProblemasActivos(@RequestParam("estado") Integer estado) {
        return problemaRepository.findByEstado(estado);
    }
    
    @GetMapping("/list")
    public List<Problema> listarProblemas(){
        return problemaRepository.findAll();

    }

    @GetMapping("/{id}/consultas")
    public List<Consulta> listarconsultasProblema(@PathVariable("id") Integer id){
        Problema problema = problemaRepository.findById(id).get();
        List<Consulta> consultas = consultaRepository.findByProblema(problema);
        
        return consultas;
    }
}
