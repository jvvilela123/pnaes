
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Pessoa implements Serializable {
    @Id @GeneratedValue
    private Integer id;
    private String nome;
    private String telefone;
    @Column(unique=true)
    private String email;
 
    @OneToOne
    @JoinColumn(nullable = false,name="endereco_id",updatable = false)
    private Endereco endereco;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

   
    

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

   

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }
    
  
    
}
