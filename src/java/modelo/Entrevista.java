/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
public class Entrevista implements Serializable{
    @Id @GeneratedValue
    private Integer id;
    private GregorianCalendar dataEntrevista;
    private String local;
    @ManyToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="inscricao_id",unique = true)
    private Inscricao inscricao;
    private String observacao;
    private String resultado;
      @OneToOne
   @JoinColumn(nullable = false,name="status_id",updatable = false)
    private StatusEntrevista se;
    private String concorrencia;
    private String dimensaoSocial;
    private String dimensaoEconomica;
    private String dimensaoAmbiental;
    private String dimensaoCultural;
    private String participaProjetos;
    private String bolsaPermanente;
    private String outraBolsa;
    private String almocoIfto;
    private String visitaDomiciliar;

    public String getConcorrencia() {
        return concorrencia;
    }

    public void setConcorrencia(String concorrencia) {
        this.concorrencia = concorrencia;
    }

    public String getDimensaoSocial() {
        return dimensaoSocial;
    }

    public void setDimensaoSocial(String dimensaoSocial) {
        this.dimensaoSocial = dimensaoSocial;
    }

    public String getDimensaoEconomica() {
        return dimensaoEconomica;
    }

    public void setDimensaoEconomica(String dimensaoEconomica) {
        this.dimensaoEconomica = dimensaoEconomica;
    }

    public String getDimensaoAmbiental() {
        return dimensaoAmbiental;
    }

    public void setDimensaoAmbiental(String dimensaoAmbiental) {
        this.dimensaoAmbiental = dimensaoAmbiental;
    }

    public String getDimensaoCultural() {
        return dimensaoCultural;
    }

    public void setDimensaoCultural(String dimensaoCultural) {
        this.dimensaoCultural = dimensaoCultural;
    }

    public String getParticipaProjetos() {
        return participaProjetos;
    }

    public void setParticipaProjetos(String participaProjetos) {
        this.participaProjetos = participaProjetos;
    }

    public String getBolsaPermanente() {
        return bolsaPermanente;
    }

    public void setBolsaPermanente(String bolsaPermanente) {
        this.bolsaPermanente = bolsaPermanente;
    }

    public String getOutraBolsa() {
        return outraBolsa;
    }

    public void setOutraBolsa(String outraBolsa) {
        this.outraBolsa = outraBolsa;
    }

    public String getAlmocoIfto() {
        return almocoIfto;
    }

    public void setAlmocoIfto(String almocoIfto) {
        this.almocoIfto = almocoIfto;
    }

    public String getVisitaDomiciliar() {
        return visitaDomiciliar;
    }

    public void setVisitaDomiciliar(String visitaDomiciliar) {
        this.visitaDomiciliar = visitaDomiciliar;
    }
    
    
    public Integer getId() {
        return id;
    }

    public Inscricao getInscricao() {
        return inscricao;
    }

    public void setInscricao(Inscricao inscricao) {
        this.inscricao = inscricao;
    }

    
    
    public void setId(Integer id) {
        this.id = id;
    }

    public GregorianCalendar getDataEntrevista() {
        return dataEntrevista;
    }

    public void setDataEntrevista(GregorianCalendar dataEntrevista) {
        this.dataEntrevista = dataEntrevista;
    }

    public String getLocal() {
        return local;
    }

    public void setLocal(String local) {
        this.local = local;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public String getResultado() {
        return resultado;
    }

    public void setResultado(String resultado) {
        this.resultado = resultado;
    }

    public StatusEntrevista getSe() {
        return se;
    }

    public void setSe(StatusEntrevista se) {
        this.se = se;
    }

    
    

   
    
    
    
}
