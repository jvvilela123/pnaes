/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Aluno;

/**
 *
 * @author ti
 */
public class AlunoDao extends DaoGenerico{
    public AlunoDao() {
        super(Aluno.class);
    }

    public Aluno buscarAlunoPor(String login) 
    {
        try {
        String jpql = "select c from Aluno c where c.cpf = '"+login+"' or c.matricula = '"+login+"'";
        //String jpql = "select c from Aluno c where c.cpf = '00982109121'";
        //System.out.println("aqui = "+jpql);
        
        Query query = em.createQuery(jpql);
        System.out.println("aqui = "+ query.getSingleResult());
        return (Aluno) query.getSingleResult();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }

    }
    
    public List<Aluno> listarAlunos() {
        try{
        String jpql = "select a from Aluno a where a.nivel = 1";
        return em.createQuery(jpql).getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    /**
     *
     * @param campusId
    * @return
     */
    public List<Aluno> listarAlunosPorCampus(Integer campusId) {
        try{
        String jpql = "select a from Aluno a where a.nivel = 1 and a.curso.campus.id = "+campusId;
      //  System.out.println("aqui = "+ jpql);
        return em.createQuery(jpql).getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    
    /**
     *
     * @param cursoId
    * @return
     */
    public List<Aluno> listarAlunosPorCurso(Integer cursoId) {
        try{
        String jpql = "select a from Aluno a where a.nivel = 1 and a.curso.id = "+cursoId;
      //  System.out.println("aqui = "+ jpql);
        return em.createQuery(jpql).getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    
    /**
     *
     * @param categoriaId
    * @return
     */
    public List<Aluno> listarAlunosPorCategoria(Integer categoriaId) {
        try{
        String jpql = "select a from Aluno a where a.nivel = 1 and a.curso.categoria.id = "+categoriaId;
       // System.out.println("aqui = "+ jpql);
        return em.createQuery(jpql).getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    
   
    
   
}
