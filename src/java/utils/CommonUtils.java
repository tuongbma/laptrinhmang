/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

/**
 *
 * @author buith
 */
public class CommonUtils {
    public static String convertTime(Long difference) {
            System.out.println(difference);
            String val = "";
            if(difference >= 86400 ) {
                difference = difference/86400 ;
                if(difference > 30) {
                    val = "Long time ";
                } else {
                    val = difference + " day(s) ";
                }
            } 
            else if(difference >= 3600) {
                difference = difference/3600;
                val = difference + " hour(s) ";
            } 
            else if(difference >= 60) {
                difference = difference/60 ;
                val = difference + " minute(s) ";
            } 
            else {
                difference = difference;
                val = difference + " second(s) ";
            }
            return val;
    }
}