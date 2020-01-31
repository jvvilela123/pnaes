/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Curso;

/**
 *
 * @author 1824433
 */
public class CursoDao extends DaoGenerico 
{
    public CursoDao() {
        super(Curso.class);
    }

    public List<Curso> buscarCursoPorCategoria(Integer categoria_id, Integer campus_id) 
    {
        try{
        String jpql = "select c from Curso c where c.categoria.id = "+categoria_id+" and c.campus.id = "+campus_id;
        Query query = em.createQuery(jpql, Curso.class);
        
        return query.getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }

    }
 
    
}
