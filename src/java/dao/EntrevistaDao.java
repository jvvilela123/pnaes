/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Entrevista;

/**
 *
 * @author euzebio
 */
public class EntrevistaDao extends DaoGenerico{
    public EntrevistaDao(){
        super(Entrevista.class);
    }
    public List<Entrevista> perquisarPorNomeAluno(String nome){
        String jpql = "select e from Entrevista e where e.inscricao.aluno.nome like '%"+nome+"%'";
        Query query = em.createQuery(jpql, Entrevista.class);        
        return query.getResultList();
    }
    
    public List<Entrevista> perquisarPorEdital(Integer editalId) 
    {
        String jpql = "select i from Entrevista i where i.inscricao.edital.id = "+editalId;
        Query query = em.createQuery(jpql, Entrevista.class);
        return query.getResultList();
    }
    public List<Entrevista> perquisarPorBolsaCategoria(Integer categoriaId, Integer bolsaId, Integer editalId) 
    {
        String jpql = "select i from Entrevista i where e.inscricao.aluno.curso.categoria.id = "+categoriaId+" and e.inscricao.bolsa1.id = "+bolsaId+" and e.inscricao.edital.id = "+editalId;        
        Query query = em.createQuery(jpql, Entrevista.class);        
        return query.getResultList();
    }
    public List<Entrevista> perquisarPorCategoria(Integer categoriaId, Integer editalId) 
    {
        String jpql = "select i from Entrevista i where e.inscricao.aluno.curso.categoria.id = "+categoriaId+" and e.inscricao.edital.id = "+editalId;        
        Query query = em.createQuery(jpql, Entrevista.class);        
        return query.getResultList();
    }
    public List<Entrevista> perquisarPorBolsa(Integer bolsaId, Integer editalId) 
    {
        String jpql = "select i from Entrevista i where e.inscricao.bolsa1.id = "+bolsaId+" and e.inscricao.edital.id = "+editalId;        
        Query query = em.createQuery(jpql, Entrevista.class);        
        return query.getResultList();
    }
}
