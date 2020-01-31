/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.util.List;
import javax.persistence.Query;
import modelo.Edital;

/**
 *
 * @author 1824433
 */
public class EditalDao extends DaoGenerico 
{
    public EditalDao() {
        super(Edital.class);
    }

    public List<Edital> buscarEditalPorCampus(Integer campus_id) 
    {
        try{
        String jpql = "select e from Edital e where e.campus.id = "+campus_id;
        Query query = em.createQuery(jpql, Edital.class);
        
        return query.getResultList();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new ExceptionInInitializerError(e);
        } finally {
            em.close();
        }

    }

    
}
