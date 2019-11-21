/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;

/**
 *
 * @author ronan
 */
public class DataFormat {
    
    public String formatarData(GregorianCalendar data){
        String dataFormatada = new SimpleDateFormat("dd/MM/yyyy").format(data.getTime());
        return dataFormatada;
    
    }
    public String formatarHora(GregorianCalendar data){
        String horaFormatada = new SimpleDateFormat("hh:mm").format(data.getTime());
        return horaFormatada;
    }
    
}
