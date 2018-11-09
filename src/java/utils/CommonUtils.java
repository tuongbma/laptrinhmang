/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author buith
 */
public class CommonUtils {
    public static String subtractTime(Date highTime, Date lowTime) {
        System.out.println(highTime + " low:" + lowTime);
//        SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        try {
           
            
            Long difference = highTime.getTime() - lowTime.getTime();
            System.out.println(difference);
            String val = "";
            if(difference >= 86400000 ) {
                difference = difference/86400000 ;
                val = difference + " day(s) ";
            } 
            else if(difference >= 3600000) {
                difference = difference/3600000;
                val = difference + " hour(s) ";
            } 
            else if(difference >= 60000) {
                difference = difference/60000 ;
                val = difference + " minute(s) ";
            }
            return val;
//        } catch (ParseException ex) {
//            Logger.getLogger(CommonUtils.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
    }
}
