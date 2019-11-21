/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import modelo.Cidade;
import java.util.List;
import javax.persistence.Query;

/**
 *
 * @author euzebio
 */
public class CidadeDao extends DaoGenerico 
{
    public CidadeDao() {
        super(Cidade.class);
    }

    public List<Cidade> buscarCidadePorUf(Integer idUf) 
    {
        String jpql = "select c from Cidade c where c.uf.id = "+idUf;
        Query query = em.createQuery(jpql, Cidade.class);
        
        return query.getResultList();

    }
    
}
