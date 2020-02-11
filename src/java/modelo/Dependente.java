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
    
    @Column(unique = true)
    private String cpfd;
    
    private String grauParentesco;
   
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

    public String getCpfd() {
        return cpfd;
    }

    public void setCpfd(String cpfd) {
        this.cpfd = cpfd;
    }
    
    
    
}
