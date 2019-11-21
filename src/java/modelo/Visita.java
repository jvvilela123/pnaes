/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Date;
import java.util.GregorianCalendar;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
public class Visita implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private GregorianCalendar dataVisita;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="inscricao_id",unique = true)
    private Inscricao inscricao;
    private String introducao;
    private String situacional;
    private String parecerSocial;

    public String getIntroducao() {
        return introducao;
    }

    public void setIntroducao(String introducao) {
        this.introducao = introducao;
    }

    public String getSituacional() {
        return situacional;
    }

    public void setSituacional(String situacional) {
        this.situacional = situacional;
    }

    public String getParecerSocial() {
        return parecerSocial;
    }

    public void setParecerSocial(String parecerSocial) {
        this.parecerSocial = parecerSocial;
    }
   

    

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }
    
   

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public GregorianCalendar getDataVisita() {
        return dataVisita;
    }

    public void setDataVisita(GregorianCalendar dataVisita) {
        this.dataVisita = dataVisita;
    }

   

    

    

   
    
    
}
