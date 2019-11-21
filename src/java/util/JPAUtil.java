/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

/**
 *
 * @author ti-3
 */
public class JPAUtil {
    
    private static final EntityManagerFactory emf;
    private static EntityManager em;
    
    static {
       try {
           emf = Persistence.createEntityManagerFactory("pnaes");
       
       }catch(Throwable ex){
           throw  new ExceptionInInitializerError(ex);
       } 
    }
    public static EntityManager getEntityManager(){
        em = emf.createEntityManager();
        return em;
    }
}
