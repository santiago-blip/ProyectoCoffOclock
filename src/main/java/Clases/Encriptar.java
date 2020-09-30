/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author santi
 */
public class Encriptar {
    public String encriptar(String pass){
        String clave = "";
        try {
            MessageDigest ms = MessageDigest.getInstance("MD5");
            byte [] encByte = ms.digest(pass.getBytes());
            BigInteger num = new BigInteger (1,encByte);
            clave = num.toString(16);
            while(clave.length()<32){
                clave = "0"+clave;
            }
        } catch (NoSuchAlgorithmException ex) {
            System.out.println("Error al encriptar "+ex);
        }
        return clave;
    }
}
