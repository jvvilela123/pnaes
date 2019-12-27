/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Inscricao;

/**
 *
 * @author euzebio
 */
public class InscricaoDao extends DaoGenerico{
    
    public InscricaoDao(){
        super(Inscricao.class);
    }
    public List<Inscricao> perquisarPorBolsa(Integer bolsaId, Integer editalId) 
    {
        String jpql = "select i from Inscricao i where i.bolsa1.id = "+bolsaId+" and i.edital.id = "+editalId;
        Query query = em.createQuery(jpql, Inscricao.class);
        return query.getResultList();
    }
    public List<Inscricao> perquisarPorCategoria(Integer categoriaId, Integer editalId) 
    {
        String jpql = "select i from Inscricao i where i.aluno.curso.categoria.id = "+categoriaId+" and i.edital.id = "+editalId;
        Query query = em.createQuery(jpql, Inscricao.class);
        return query.getResultList();
    }
    public List<Inscricao> perquisarPorEdital(Integer editalId) 
    {
        String jpql = "select i from Inscricao i where i.edital.id = "+editalId;
        Query query = em.createQuery(jpql, Inscricao.class);
        return query.getResultList();
    }
    public List<Inscricao> perquisarPorBolsaECategoria(Integer categoriaId, Integer bolsaId, Integer editalId) 
    {
        String jpql = "select i from Inscricao i where i.aluno.curso.categoria.id = "+categoriaId+" and i.bolsa1.id = "+bolsaId+" and i.edital.id = "+editalId;        
        Query query = em.createQuery(jpql, Inscricao.class);        
        return query.getResultList();
    }
    public List<Inscricao> perquisarAlunoPorEdital(Integer alunoId, Integer editalId) {
        try {
            String jpql = "select i from Inscricao i  where i.aluno.id = "+alunoId+" and i.edital.id = "+editalId;
            return em.createQuery(jpql, Inscricao.class).getResultList();

        } catch (Exception ex) {
            return null;
        }
    }
        
    public Inscricao perquisarPorAlunoEEdital(Integer alunoId, Integer editalId) {
        try {
            String jpql = "select i from Inscricao i  where i.aluno.id = "+alunoId+" and i.edital.id = "+editalId;
            return (Inscricao) em.createQuery(jpql, Inscricao.class);

        } catch (Exception ex) {
            return null;
        }
    }
}
