package Clases;

import java.text.SimpleDateFormat;
import java.util.Calendar;

public class Fecha {

   public static Calendar calendario = Calendar.getInstance();
   private static String fecha;

    public Fecha() {
    }
   
   public static String Fecha(){
       SimpleDateFormat dateFormat = new SimpleDateFormat("yyy-MM-dd");
       fecha = dateFormat.format(calendario.getTime());
       return fecha;
   }
   
}
