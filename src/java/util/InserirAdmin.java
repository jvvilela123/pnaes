/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import dao.DaoFactory;
import java.util.GregorianCalendar;
import java.util.List;
import modelo.Aluno;
import modelo.Endereco;


/**
 *
 * @author ronan
 */
public class InserirAdmin {
    
    
    public static void main(String[] args) {
        
        Aluno aluno = new Aluno();
        DaoFactory daoFactory = new DaoFactory();
        aluno.setNome("Admin");
        aluno.setCpf("123456");
        aluno.setNivel(3);
        aluno.setStatusCadastro(0);
        daoFactory.getAlunoDao().inserirOuAlterar(aluno);
     }
    
}