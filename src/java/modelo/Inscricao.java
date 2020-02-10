/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

/**
 *
 * @author ronan
 */
@Entity
public class Inscricao implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private GregorianCalendar dataInscricao;
    @ManyToOne
    @JoinColumn(name="aluno_id")
    private Aluno aluno;
    @ManyToOne
    @JoinColumn(name="bolsa1_id")
    private Bolsa bolsa1;
    @ManyToOne
    @JoinColumn(name="bolsa2_id")
    private Bolsa bolsa2;
    private String graduacao;
    private String justificativa;
    private String resultado;
    private String status;
    private String quantas;
    private String documentosFaltantes;
    private String motivoBolsa;
    private String almocaIfto;
    @ManyToOne
    @JoinColumn(name="edital_id",nullable = false)
    private Edital edital;
   
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getMotivoBolsa() {
        return motivoBolsa;
    }

    public void setMotivoBolsa(String motivoBolsa) {
        this.motivoBolsa = motivoBolsa;
    }

    public GregorianCalendar getDataInscricao() {
        return dataInscricao;
    }

    public String getJustificativa() {
        return justificativa;
    }

    public void setJustificativa(String justificativa) {
        this.justificativa = justificativa;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public String getDocumentosFaltantes() {
        return documentosFaltantes;
    }

    public void setDocumentosFaltantes(String documentosFaltantes) {
        this.documentosFaltantes = documentosFaltantes;
    }

    public void setDataInscricao(GregorianCalendar dataInscricao) {
        this.dataInscricao = dataInscricao;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    
    public Bolsa getBolsa1() {
        return bolsa1;
    }

    public void setBolsa1(Bolsa bolsa1) {
        this.bolsa1 = bolsa1;
    }

    public Bolsa getBolsa2() {
        return bolsa2;
    }

    public void setBolsa2(Bolsa bolsa2) {
        this.bolsa2 = bolsa2;
    }

    public Edital getEdital() {
        return edital;
    }

    public void setEdital(Edital edital) {
        this.edital = edital;
    }

    public String getGraduacao() {
        return graduacao;
    }

    public void setGraduacao(String graduacao) {
        this.graduacao = graduacao;
    }
  
    public String getQuantas() {
        return quantas;
    }

    public void setQuantas(String quantas) {
        this.quantas = quantas;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAlmocaIfto() {
        return almocaIfto;
    }

    public void setAlmocaIfto(String almocaIfto) {
        this.almocaIfto = almocaIfto;
    }
    
    
    
    
}
