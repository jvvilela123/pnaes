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
        String jpql = "select c from Aluno c where c.cpf = '"+login+"' or c.matricula = '"+login+"'";
        //String jpql = "select c from Aluno c where c.cpf = '00982109121'";
        //System.out.println("aqui = "+jpql);
        
        Query query = em.createQuery(jpql);
        System.out.println("aqui = "+query.getResultList());
        return (Aluno) query.getResultList().get(0);

    }
    
   
}
