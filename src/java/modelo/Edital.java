/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author ronan
 */
@Entity
public class Edital implements Serializable {

    @Id
    @GeneratedValue
    private Integer id;
    private String numero;
    private GregorianCalendar dataInicial;
    private GregorianCalendar dataFinal;
    @OneToMany(
        cascade = CascadeType.ALL,
        orphanRemoval = true,
        fetch = FetchType.EAGER 
    )
    private List<Bolsa> bolsas;
    @ManyToOne
    private Campus campus;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

    public GregorianCalendar getDataInicial() {
        return dataInicial;
    }

    public void setDataInicial(GregorianCalendar dataInicial) {
        this.dataInicial = dataInicial;
    }

    public GregorianCalendar getDataFinal() {
        return dataFinal;
    }

    public void setDataFinal(GregorianCalendar dataFinal) {
        this.dataFinal = dataFinal;
    }

    public List<Bolsa> getBolsas() {
        
        return bolsas;
    }

    public void setBolsas(List<Bolsa> bolsas) {
        this.bolsas = bolsas;
    }

    public Campus getCampus() {
        return campus;
    }

    public void setCampus(Campus campus) {
        this.campus = campus;
    }
    
    public String getNumeroEAno() {
        String ano = String.valueOf(getDataInicial().get(Calendar.YEAR));
        
        return numero+"/"+ano;
    }
    

}
