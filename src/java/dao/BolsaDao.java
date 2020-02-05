/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Bolsa;

/**
 *
 * @author 1824433
 */
public class BolsaDao extends DaoGenerico 
{
    public BolsaDao() {
        super(Bolsa.class);
    }

    public List<Bolsa> buscarBolsaPorEdital(Integer edital_id) 
    {
        try{
        String jpql = "select b from Bolsa b where b.edital.id = "+edital_id;
        Query query = em.createQuery(jpql, Bolsa.class);
        
        return query.getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }

    }

    
}
