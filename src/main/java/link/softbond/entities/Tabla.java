package link.softbond.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "tabla")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Tabla {
	
	@Id
	@javax.persistence.GeneratedValue(strategy = javax.persistence.GenerationType.IDENTITY)
	private Integer id;
	
	
	private String nombre;
	
	private String descripcion;
	
	@OneToMany
	@JoinColumn(name = "idproblema")
	private Problema problema;

}
