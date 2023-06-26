package link.softbond.entities;



import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "problema")
public class Problema {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    private String nombre;

    private String descripcion;

    private String docente;

    private Integer estado;

    private String nombrebase;

    @OneToMany(mappedBy = "problema")
    @JsonIgnore
    private List<Examen> examenes;

    @OneToMany(mappedBy = "problema")
    @JsonIgnore
    private List<Tabla> tablas;
}
