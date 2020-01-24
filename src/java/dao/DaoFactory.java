/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.*;
/**
 *
 * @author ti-3
 */
public class DaoFactory {
    
    
    public DaoGenerico<Bolsa> getBolsaDao(){
        return new DaoGenerico<Bolsa>(Bolsa.class);
    }
    public DaoGenerico<Endereco> getEnderecoDao(){
        return new DaoGenerico<Endereco>(Endereco.class);
    } 
       public DaoGenerico<Uf> getUfDao(){
        return new DaoGenerico<Uf>(Uf.class);
    } 
    public CidadeDao getCidadeDao() {
        return new CidadeDao();
    }
    public AlunoDao getAlunoDao(){
        return new AlunoDao();
    }
    public DaoGenerico<Despesa>getDespesaDao(){
        return new DaoGenerico<Despesa>(Despesa.class);
    }
     public DaoGenerico<Empresa> getEmpresaDao(){
        return new DaoGenerico<Empresa>(Empresa.class);
    }
    public EntrevistaDao getEntrevistaDao(){
        return new EntrevistaDao();
    }
    public InscricaoDao getInscricaoDao(){
        return new InscricaoDao();
    }
    public DaoGenerico<Pessoa> getPessoaDao(){
        return new DaoGenerico<Pessoa>(Pessoa.class);
    }
    public DaoGenerico<Visita> getVisitaDao(){
        return new DaoGenerico<Visita>(Visita.class);
    }
    public DaoGenerico<Dependente> getDependenteDao(){
        return new DaoGenerico<Dependente>(Dependente.class);
    }
    public DaoGenerico<FichaMedica> getFichaMedicaDao(){
        return new DaoGenerico<FichaMedica>(FichaMedica.class);
    }
      public DaoGenerico<Edital>getEditalDao(){
        return new DaoGenerico<Edital>(Edital.class);
    }
    
    public CursoDao getCursoDao() {
        return new CursoDao();
    }    
    public DaoGenerico<Categoria>getCategoriaDao(){
        return new DaoGenerico<Categoria>(Categoria.class);
    }  
}