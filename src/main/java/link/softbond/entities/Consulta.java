package link.softbond.entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Entity
@Table(name = "consulta")
public class Consulta {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @ManyToOne
    @JoinColumn(name ="idproblema")
    private Problema problema;

    private String descripcion;

    private String explicacion;

    private String solucion;

    private String explicsolucion;

    private String solucionalternativa;

    private Integer numpracticas;

    private Integer estado;
}
