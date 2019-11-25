/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import java.io.Serializable;
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
public class FichaMedica implements Serializable{
    
    @Id @GeneratedValue
    private Integer id;
    private String temDoenca;
    private String qualDoenca;
    private String temDoencaDep;
    private String qualDoencaDep;
    private String temMedicamento;
    private String qualMedicamento;
    private String temMedicamentoDep;
    private String qualMedicamentoDep;
    private String temDeficiencia;
    private String qualDeficiencia;
    private String temDeficienciaDep;
    private String qualDeficienciaDep;
   
    @OneToOne
    @JoinColumn(name="aluno_id", unique=true)
    private Aluno aluno;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTemDoenca() {
        return temDoenca;
    }

    public void setTemDoenca(String temDoenca) {
        this.temDoenca = temDoenca;
    }

    public String getQualDoenca() {
        return qualDoenca;
    }

    public void setQualDoenca(String qualDoenca) {
        this.qualDoenca = qualDoenca;
    }

    public String getTemDoencaDep() {
        return temDoencaDep;
    }

    public void setTemDoencaDep(String temDoencaDep) {
        this.temDoencaDep = temDoencaDep;
    }

    public String getQualDoencaDep() {
        return qualDoencaDep;
    }

    public void setQualDoencaDep(String qualDoencaDep) {
        this.qualDoencaDep = qualDoencaDep;
    }

    public String getTemMedicamento() {
        return temMedicamento;
    }

    public void setTemMedicamento(String temMedicamento) {
        this.temMedicamento = temMedicamento;
    }

    public String getQualMedicamento() {
        return qualMedicamento;
    }

    public void setQualMedicamento(String qualMedicamento) {
        this.qualMedicamento = qualMedicamento;
    }

    public String getTemMedicamentoDep() {
        return temMedicamentoDep;
    }

    public void setTemMedicamentoDep(String temMedicamentoDep) {
        this.temMedicamentoDep = temMedicamentoDep;
    }

    public String getQualMedicamentoDep() {
        return qualMedicamentoDep;
    }

    public void setQualMedicamentoDep(String qualMedicamentoDep) {
        this.qualMedicamentoDep = qualMedicamentoDep;
    }

    public String getTemDeficiencia() {
        return temDeficiencia;
    }

    public void setTemDeficiencia(String temDeficiencia) {
        this.temDeficiencia = temDeficiencia;
    }

    public String getQualDeficiencia() {
        return qualDeficiencia;
    }

    public void setQualDeficiencia(String qualDeficiencia) {
        this.qualDeficiencia = qualDeficiencia;
    }

    public String getTemDeficienciaDep() {
        return temDeficienciaDep;
    }

    public void setTemDeficienciaDep(String temDeficienciaDep) {
        this.temDeficienciaDep = temDeficienciaDep;
    }

    public String getQualDeficienciaDep() {
        return qualDeficienciaDep;
    }

    public void setQualDeficienciaDep(String qualDeficienciaDep) {
        this.qualDeficienciaDep = qualDeficienciaDep;
    }
    
    

   

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }
  
}