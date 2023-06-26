package link.softbond.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import link.softbond.entities.Tabla;
import link.softbond.repositorios.ProblemaRepository;
import link.softbond.repositorios.TablaRepository;

@RestController
@RequestMapping("/problemas")
public class ProblemaController {

	@Autowired
	TablaRepository tablaRepository;
	
	@Autowired
	ProblemaRepository problemaRepository;
	
	

	@GetMapping("/{id}/tablas/{id}/datos")
	public Tabla listarDatosTabla(@PathVariable("id") Integer id) {
		Tabla tabla = tablaRepository.getReferenceById(id);
		
		
		return tabla;
	}
	
}
