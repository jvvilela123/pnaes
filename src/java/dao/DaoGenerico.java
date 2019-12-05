/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import modelo.Empresa;
import util.JPAUtil;

/**
 *
 * @author ti-3
 */
public class DaoGenerico<T> {

    private Class classe;
    protected EntityManager em;

    public DaoGenerico() {
        em = JPAUtil.getEntityManager();
    }

    public DaoGenerico(Class classe) {
        this.classe = classe;
        em = JPAUtil.getEntityManager();
    }

    public void inserirOuAlterar(T u) {
        try {
            em.getTransaction().begin();
            em.merge(u);
            em.getTransaction().commit();
           // System.out.println("classee = "+em.getTransaction().getClass().);
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }
    public T inserirOuAlterarComRetorno(T u) {
        try {
            em.getTransaction().begin();
            u = em.merge(u);
            em.getTransaction().commit();                      
            return u;
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }

    public void excluir(T u) {
        try {
            em.getTransaction().begin();
            u = em.merge(u);
            em.remove(u);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }
    }

    public T pesquisarPorId(Integer id) {
        return (T) this.em.find(classe, id);
    }

    public List<T> listar() {
        String jpql = "select a from " + classe.getSimpleName() + " a";
        return em.createQuery(jpql, classe).getResultList();
    }

    public List<T> pesquisarPor(String busca, String campo) {
        String jpql = "select a from " + classe.getSimpleName() + " a where a." + campo + " like '%" + busca + "%'";
        return em.createQuery(jpql, classe).getResultList();
    }

    public List<T> perquisarPorAluno(Integer alunoId) {
        try {
            String jpql = "select a from " + classe.getSimpleName() + " a where a.aluno.id = " + alunoId;
            return em.createQuery(jpql, classe).getResultList();

        } catch (Exception ex) {
            return null;
        }

    }
    public T perquisarClassePorAluno(Integer alunoId) {
        try {
            String jpql = "select a from " + classe.getSimpleName() + " a where a.aluno.id = " + alunoId;
            return (T) em.createQuery(jpql, classe).getSingleResult();

        } catch (Exception ex) {
            return null;
        }

    }
    
}
