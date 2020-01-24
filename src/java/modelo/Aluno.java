package modelo;

import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@PrimaryKeyJoinColumn(name="pessoa_id")
public class Aluno extends Pessoa{
    
    private String estadoCivil;
    private Integer statusCadastro;
    private String matricula;
    private Integer nivel;
    private String ensinoMedio;
    private String ensinoFundamental;
    private String entradaIfto;
    private String periodoVisita;
    private String meioTransporte;
    private Integer periodo;
    private Boolean reprovou;
    private Integer reprovouQuantas;
    private String dependeciaFamiliar;
    private String moradia;
    private String ondeReside;
    private String tipoMoradia;
    @ManyToOne
    private Curso curso;

    public String getEstadoCivil() {
        return estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

     public Integer getStatusCadastro() {
        return statusCadastro;
    }

    public void setStatusCadastro(Integer statusCadastro) {
        this.statusCadastro = statusCadastro;
    }
    public String getDependeciaFamiliar() {
        return dependeciaFamiliar;
    }

    public void setDependeciaFamiliar(String dependeciaFamiliar) {
        this.dependeciaFamiliar = dependeciaFamiliar;
    }

    public String getMoradia() {
        return moradia;
    }

    public void setMoradia(String moradia) {
        this.moradia = moradia;
    }

    public String getOndeReside() {
        return ondeReside;
    }

    public void setOndeReside(String ondeReside) {
        this.ondeReside = ondeReside;
    }

    public String getTipoMoradia() {
        return tipoMoradia;
    }

    public void setTipoMoradia(String tipoMoradia) {
        this.tipoMoradia = tipoMoradia;
    }
 
    public Boolean getReprovou() {
        return reprovou;
    }

    public void setReprovou(Boolean reprovou) {
        this.reprovou = reprovou;
    }

    public Integer getReprovouQuantas() {
        return reprovouQuantas;
    }

    public void setReprovouQuantas(Integer reprovouQuantas) {
        this.reprovouQuantas = reprovouQuantas;
    }

    public String getMatricula() {
        return matricula;
    }

    public void setMatricula(String matricula) {
        this.matricula = matricula;
    }

    public Integer getNivel() {
        return nivel;
    }

    public void setNivel(Integer nivel) {
        this.nivel = nivel;
    }

    public String getEnsinoMedio() {
        return ensinoMedio;
    }

    public void setEnsinoMedio(String ensinoMedio) {
        this.ensinoMedio = ensinoMedio;
    }

    public String getEnsinoFundamental() {
        return ensinoFundamental;
    }

    public void setEnsinoFundamental(String ensinoFundamental) {
        this.ensinoFundamental = ensinoFundamental;
    }

    public String getPeriodoVisita() {
        return periodoVisita;
    }

    public void setPeriodoVisita(String periodoVisita) {
        this.periodoVisita = periodoVisita;
    }

    public String getMeioTransporte() {
        return meioTransporte;
    }

    public void setMeioTransporte(String meioTransporte) {
        this.meioTransporte = meioTransporte;
    }

    public String getEntradaIfto() {
        return entradaIfto;
    }

    public void setEntradaIfto(String entradaIfto) {
        this.entradaIfto = entradaIfto;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
    
    public Integer getPeriodo() {
        return periodo;
    }

    public void setPeriodo(Integer periodo) {
        this.periodo = periodo;
    }
  
    

    
    
       
}