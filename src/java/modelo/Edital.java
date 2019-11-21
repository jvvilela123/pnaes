/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

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

}
