/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

/**
 *
 * @author ti
 */
@Entity
public class Resultado implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="bolsa1_id")
    private Bolsa bolsa1;
    private String resultadoBolsa1;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="bolsa2_id")
    private Bolsa bolsa2;
    private String resultadoBolsa2;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="inscricao_id",unique = true)
    private Inscricao inscricao;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Bolsa getBolsa1() {
        return bolsa1;
    }

    public void setBolsa1(Bolsa bolsa1) {
        this.bolsa1 = bolsa1;
    }

    public String getResultadoBolsa1() {
        return resultadoBolsa1;
    }

    public void setResultadoBolsa1(String resultadoBolsa1) {
        this.resultadoBolsa1 = resultadoBolsa1;
    }

    public Bolsa getBolsa2() {
        return bolsa2;
    }

    public void setBolsa2(Bolsa bolsa2) {
        this.bolsa2 = bolsa2;
    }

    public String getResultadoBolsa2() {
        return resultadoBolsa2;
    }

    public void setResultadoBolsa2(String resultadoBolsa2) {
        this.resultadoBolsa2 = resultadoBolsa2;
    }

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }
    
}
