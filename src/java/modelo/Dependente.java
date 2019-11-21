/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.util.GregorianCalendar;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@PrimaryKeyJoinColumn(name="pessoa_id")
public class Dependente extends Pessoa{
    @ManyToOne
    @JoinColumn(name="aluno_id")
    private Aluno aluno;
    @Column(unique = true, nullable = true)
    private String cpf;
    private String rg;
    @ManyToOne
    @JoinColumn(name="ufExpedicao_id")
    private Uf ufExpedicao;
    private String sexo;
    private GregorianCalendar dtn;
    private String grauParentesco;
    @Column(precision=2)
    private String tipoDeficiente;
    private String atividadeProf;
    private Double renda;
    
    
    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

   
    public String getGrauParentesco() {
        return grauParentesco;
    }

    public void setGrauParentesco(String grauParentesco) {
        this.grauParentesco = grauParentesco;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Uf getUfExpedicao() {
        return ufExpedicao;
    }

    public void setUfExpedicao(Uf ufExpedicao) {
        this.ufExpedicao = ufExpedicao;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public GregorianCalendar getDtn() {
        return dtn;
    }

    public void setDtn(GregorianCalendar dtn) {
        this.dtn = dtn;
    }

   

    public String getTipoDeficiente() {
        return tipoDeficiente;
    }

    public void setTipoDeficiente(String tipoDeficiente) {
        this.tipoDeficiente = tipoDeficiente;
    }

    public String getAtividadeProf() {
        return atividadeProf;
    }

    public void setAtividadeProf(String atividadeProf) {
        this.atividadeProf = atividadeProf;
    }

    public Double getRenda() {
        return renda;
    }

    public void setRenda(Double renda) {
        this.renda = renda;
    }
    
    
    
}
