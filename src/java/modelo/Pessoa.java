
package modelo;

import java.io.Serializable;
import java.util.GregorianCalendar;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.persistence.*;

/**
 *
 * @author ronan
 */
@Entity
@Inheritance(strategy = InheritanceType.JOINED)
public class Pessoa implements Serializable {
    @Id @GeneratedValue
    private Integer id;
    private String nome;
    private String telefone;
    private String email;
    
    @Column(unique = true)
    private String cpf;
    
    private String sexo;
    private String rg;
    private String autoDeclaracao;
    
    @ManyToOne
    @JoinColumn(name="ufExpedicao_id")
    private Uf ufExpedicao;
    
    private GregorianCalendar dtn;
    
    @OneToOne
    @JoinColumn(name="endereco_id")
    private Endereco endereco;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNome() {
        return getNomeSemAcento(nome);
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    public GregorianCalendar getDtn() {
        return dtn;
    }

    public void setDtn(GregorianCalendar dtn) {
        this.dtn = dtn;
    }
    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }
    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public Uf getUfExpedicao() {
        return ufExpedicao;
    }

    public void setUfExpedicao(Uf ufExpedicao) {
        this.ufExpedicao = ufExpedicao;
    }

    public Endereco getEndereco() {
        return endereco;
    }

    public void setEndereco(Endereco endereco) {
        this.endereco = endereco;
    }

    public String getAutoDeclaracao() {
        return autoDeclaracao;
    }

    public void setAutoDeclaracao(String autoDeclaracao) {
        this.autoDeclaracao = autoDeclaracao;
    }
    
    
   /* public String getIdade() {
		GregorianCalendar hj=new GregorianCalendar();
		GregorianCalendar nascimento=new GregorianCalendar();
		if(getDtn()!=null){
			nascimento.setTime(getDtn().getTime());
		}		
		int anohj=hj.get(Calendar.YEAR);
		int anoNascimento=nascimento.get(Calendar.YEAR);
                int meshj=hj.get(Calendar.MONTH);
		int mesNascimento=nascimento.get(Calendar.MONTH);
                if(anohj-anoNascimento>0)
                return (anohj-anoNascimento + " Anos");
                else if(anohj-anoNascimento==1)
                return (anohj-anoNascimento + " Ano");
                else
                return (meshj-mesNascimento+ " Meses");
                
	}*/
    
                public String getIdade()
            {
                GregorianCalendar hj=new GregorianCalendar();
                
               /*int idade = hj.get(Calendar.YEAR) - getDtn().get(Calendar.YEAR) ;
                
               if(hj.get(Calendar.MONTH) < getDtn().get(Calendar.MONTH) || getDtn().get(Calendar.DAY_OF_MONTH) < getDtn().get(Calendar.DAY_OF_MONTH))
                 idade--;
               long idade2 = hj.getTimeInMillis() - getDtn().getTimeInMillis();
                //idade = (int) floor(((((idade2) / 60) / 60) / 24) / 365.25);
                //idade = (int) ((idade2) / (1000*60*60*24) / 30) / 12;
                // long diff = hj.getTime().getTime() - getDtn().getTime().getTime();*/
                int idade = (int) ((hj.getTime().getTime() - getDtn().getTime().getTime())/(1000*60*60*24*365.25));
                //int idadeMeses = idade * 12;
                int idadeMeses = (int) ((hj.getTime().getTime() - getDtn().getTime().getTime()) / (1000*60*60*24)) / 30;
               
                 if (idade < 1){
                     if(idadeMeses>1)
                     return idadeMeses + " Meses";
                     else
                      return idadeMeses + " Mês";
                 }else if(idade == 1){ 
                 return idade + " Ano";
                 }else
                  return idade + " Anos";
            }
               
                
                public  String getNomeSemAcento( String nomeSemAcento){
                      
                      String caracEspecial = "ÁÉÍÓÚáéíóúÂÊÎÔÛâêîôûÃÕÇçÃãÕõÀÈÌÒÙàèìòùÄËÏÖÜäëïöü";
                      String caracNormal   = "AEIOUaeiouAEIOUaeiouAOCcAaOoAEIOUaeiouAEIOUaeiou";
                      Pattern pattern = Pattern.compile("[" + caracEspecial + "]");
                     
                      Matcher matcher = pattern.matcher(nomeSemAcento);
                      int p, aux;
                      char oldChar, newChar;
                      while(matcher.find()){
                       p = matcher.start();
                       oldChar = nomeSemAcento.charAt(p);
                       aux = caracEspecial.indexOf(oldChar);
                       if(aux < 0){
                           continue;
                       }
                       newChar = caracNormal.charAt(aux);
                       nomeSemAcento = nomeSemAcento.replace(oldChar, newChar);
                      }
                      return nomeSemAcento.toUpperCase();
                     }
                
  
    
}
