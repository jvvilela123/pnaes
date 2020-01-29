
package modelo;

import java.io.Serializable;
import static java.lang.Math.floor;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
    private String cpf;
    private String sexo;
    private String rg;
    
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
        return nome;
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
  
    
}
