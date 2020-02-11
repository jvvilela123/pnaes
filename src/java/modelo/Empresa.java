/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
public class Empresa implements Serializable{
    @Id
    @GeneratedValue
    private Integer id;
    
  
    @ManyToOne
    @JoinColumn(name="aluno_id", unique = true)
    private Aluno aluno;
    private Boolean temCarteira;
    private String atividade;
    private String telefone;
    private String nome;
    private Double renda;
    private Double orenda;
   
 
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
    
    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public Boolean getTemCarteira() {
        return temCarteira;
    }

    public void setTemCarteira(Boolean temCarteira) {
        this.temCarteira = temCarteira;
    }
    
    
    public String getAtividade() {
        return atividade;
    }

    public void setAtividade(String atividade) {
        this.atividade = atividade;
    }
    
    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public Double getRenda() {
        return renda;
    }

    public void setRenda(Double renda) {
        this.renda = renda;
    }

    public Double getOrenda() {
        return orenda;
    }

    public void setOrenda(Double orenda) {
        this.orenda = orenda;
    }

}
