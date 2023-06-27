package link.softbond.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import link.softbond.entities.Examen;
import link.softbond.repositorios.ExamenRepository;

@RestController
@RequestMapping("/examen")
public class ExamenController {
	
	@Autowired
	ExamenRepository examenRepository;
	
	
	@GetMapping
	public List<Examen> listarExamenes() {
		
		return examenRepository.findAll();
	}
	
	
	@GetMapping("/{id}/listar")
	public Optional<Examen> listarPreguntasDelExamen(@PathVariable("id") Integer id) {
		return examenRepository.findById(id);
	}

}
