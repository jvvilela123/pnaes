/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.net.InetSocketAddress;
import java.net.Socket;
import java.util.Hashtable;
import java.util.List;
import javax.naming.Context;
import javax.naming.NamingException;
import javax.naming.ldap.InitialLdapContext;
import javax.naming.ldap.LdapContext;

/**
 *
 * @author ti
 */
public class LDAP {

    protected LdapContext ctx;

    public void close() throws Exception {
        this.ctx.close();
    }

    public boolean testaConexao(String user, String pass) {

        boolean conexaoOk = true;
        try {
            this.conectaDiretorio(user, pass);
        } catch (Exception e) {
            
            System.out.println("Conect: testaConexao - ERRO: " + e);
            e.printStackTrace();
            conexaoOk = false;
            
        }
        return conexaoOk;
    }

    public boolean auntenticaUsuario(String user, String pass) throws Exception {
        boolean conexaoOk = true;
        try {
            this.conectaDiretorio(user, pass);
            this.ctx.close();
        } catch (Exception e) {
            conexaoOk = false;
        }
        return conexaoOk;
    }

    @SuppressWarnings({"rawtypes", "unchecked"})
    public void conectaDiretorio(String user, String pass) throws Exception {
        String initialContextFactory = "com.sun.jndi.ldap.LdapCtxFactory";
        String providerUrl = "ldap://10.8.0.17:389/dc=ifto,dc=local,ou=users";
        Hashtable env = new Hashtable();
        env.put(Context.INITIAL_CONTEXT_FACTORY, initialContextFactory);
        env.put(Context.PROVIDER_URL, providerUrl);
        env.put(Context.SECURITY_PRINCIPAL, user + "@ifto.local");
        env.put(Context.SECURITY_CREDENTIALS, pass);
        // seta timeout 5 segundos
       /* if (conexao.getTipoAD() == 1) {
            env.put("com.sun.jndi.ldap.connect.timeout", "5000");
        }*/ //para AD nao da certo esse timeout
        ctx = new InitialLdapContext(env, null);
    }
    public static void main(String[] args) throws Exception {
        LDAP ldap = new LDAP();
        boolean a = ldap.auntenticaUsuario("02735540189", "joao2020");
        System.out.println("a = "+a);
    }
}
