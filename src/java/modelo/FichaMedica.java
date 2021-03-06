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
import javax.persistence.OneToOne;

/**
 *
 * @author ronan
 */
@Entity
public class FichaMedica implements Serializable{
    
    @Id @GeneratedValue
    private Integer id;
    private Boolean temDoenca;
    private String qualDoenca;
    private Boolean temDoencaDep;
    private String qualDoencaDep;
    private Boolean temMedicamento;
    private String qualMedicamento;
    private Boolean temMedicamentoDep;
    private String quemMedicamentoDep;
    private Boolean temDeficiencia;
    private String qualDeficiencia;
    private Boolean temDeficienciaDep;
    private String qualDeficienciaDep;
    private Boolean temCartaoSUS;
    private Boolean temPlanoSaude;
   
    @OneToOne
    @JoinColumn(name="aluno_id", unique=true)
    private Aluno aluno;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Boolean getTemDoenca() {
        return temDoenca;
    }

    public void setTemDoenca(Boolean temDoenca) {
        this.temDoenca = temDoenca;
    }

    public String getQualDoenca() {
        return qualDoenca;
    }

    public void setQualDoenca(String qualDoenca) {
        this.qualDoenca = qualDoenca;
    }

    public Boolean getTemDoencaDep() {
        return temDoencaDep;
    }

    public void setTemDoencaDep(Boolean temDoencaDep) {
        this.temDoencaDep = temDoencaDep;
    }

    public String getQualDoencaDep() {
        return qualDoencaDep;
    }

    public void setQualDoencaDep(String qualDoencaDep) {
        this.qualDoencaDep = qualDoencaDep;
    }

    public Boolean getTemMedicamento() {
        return temMedicamento;
    }

    public void setTemMedicamento(Boolean temMedicamento) {
        this.temMedicamento = temMedicamento;
    }

    public String getQualMedicamento() {
        return qualMedicamento;
    }

    public void setQualMedicamento(String qualMedicamento) {
        this.qualMedicamento = qualMedicamento;
    }

    public Boolean getTemMedicamentoDep() {
        return temMedicamentoDep;
    }

    public void setTemMedicamentoDep(Boolean temMedicamentoDep) {
        this.temMedicamentoDep = temMedicamentoDep;
    }

    public String getQuemMedicamentoDep() {
        return quemMedicamentoDep;
    }

    public void setQuemMedicamentoDep(String quemMedicamentoDep) {
        this.quemMedicamentoDep = quemMedicamentoDep;
    }

    public Boolean getTemDeficiencia() {
        return temDeficiencia;
    }

    public void setTemDeficiencia(Boolean temDeficiencia) {
        this.temDeficiencia = temDeficiencia;
    }

    public String getQualDeficiencia() {
        return qualDeficiencia;
    }

    public void setQualDeficiencia(String qualDeficiencia) {
        this.qualDeficiencia = qualDeficiencia;
    }

    public Boolean getTemDeficienciaDep() {
        return temDeficienciaDep;
    }

    public void setTemDeficienciaDep(Boolean temDeficienciaDep) {
        this.temDeficienciaDep = temDeficienciaDep;
    }

    public String getQualDeficienciaDep() {
        return qualDeficienciaDep;
    }

    public void setQualDeficienciaDep(String qualDeficienciaDep) {
        this.qualDeficienciaDep = qualDeficienciaDep;
    }

    public Boolean getTemCartaoSUS() {
        return temCartaoSUS;
    }

    public void setTemCartaoSUS(Boolean temCartaoSUS) {
        this.temCartaoSUS = temCartaoSUS;
    }

    public Boolean getTemPlanoSaude() {
        return temPlanoSaude;
    }

    public void setTemPlanoSaude(Boolean temPlanoSaude) {
        this.temPlanoSaude = temPlanoSaude;
    }
    
    
    
    
    
    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }
  
}