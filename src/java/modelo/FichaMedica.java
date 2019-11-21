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
    private String tipoDoenca;
    private String medicamento;
    private String medicamentoDep;
    private String qualMedicamento;
    private String qualMedicamentoDep;
    private String doencaCronica;
    private String qualDoenca;
    private String deficiencia;
    private String qualDeficiencia;
    private String deficienciaDep;
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

    public String getTipoDoenca() {
        return tipoDoenca;
    }

    public void setTipoDoenca(String tipoDoenca) {
        this.tipoDoenca = tipoDoenca;
    }

    public String getMedicamento() {
        return medicamento;
    }

    public void setMedicamento(String medicamento) {
        this.medicamento = medicamento;
    }

    public String getDoencaCronica() {
        return doencaCronica;
    }

    public void setDoencaCronica(String doencaCronica) {
        this.doencaCronica = doencaCronica;
    }

    public String getDeficiencia() {
        return deficiencia;
    }

    public void setDeficiencia(String deficiencia) {
        this.deficiencia = deficiencia;
    }

    public String getDeficienciaDep() {
        return deficienciaDep;
    }

    public void setDeficienciaDep(String deficienciaDep) {
        this.deficienciaDep = deficienciaDep;
    }

    public Aluno getAluno() {
        return aluno;
    }

    public void setAluno(Aluno aluno) {
        this.aluno = aluno;
    }

    public String getQualMedicamento() {
        return qualMedicamento;
    }

    public void setQualMedicamento(String qualMedicamento) {
        this.qualMedicamento = qualMedicamento;
    }

    public String getQualDoenca() {
        return qualDoenca;
    }

    public void setQualDoenca(String qualDoenca) {
        this.qualDoenca = qualDoenca;
    }

    public String getQualDeficiencia() {
        return qualDeficiencia;
    }

    public void setQualDeficiencia(String qualDeficiencia) {
        this.qualDeficiencia = qualDeficiencia;
    }

    public String getQualDeficienciaDep() {
        return qualDeficienciaDep;
    }

    public void setQualDeficienciaDep(String qualDeficienciaDep) {
        this.qualDeficienciaDep = qualDeficienciaDep;
    }

    public String getMedicamentoDep() {
        return medicamentoDep;
    }

    public void setMedicamentoDep(String medicamentoDep) {
        this.medicamentoDep = medicamentoDep;
    }

    public String getQualMedicamentoDep() {
        return qualMedicamentoDep;
    }

    public void setQualMedicamentoDep(String qualMedicamentoDep) {
        this.qualMedicamentoDep = qualMedicamentoDep;
    }
     
}
