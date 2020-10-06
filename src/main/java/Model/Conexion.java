/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion {
    private static Connection con = null;
    private static PreparedStatement st = null;
    private static ResultSet rs = null;
    
    
    //Método para generar la conexión a bd.
    public static Connection conexion() {
        try {
            //Cargar driver de conexión.
          Class.forName("com.mysql.jdbc.Driver");
          //Conectar a la bd.
          con = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyecto?useSSL=false&serverTimezone=UTC", "root", "");
        } catch (SQLException ex) {
            System.out.println("Error al hacer la conexión: " + ex);
        } catch (ClassNotFoundException ex) {
            System.out.println("Error en la conexión por: "+ex);
        }
        return con;
    }

    
    
    //Método para cerrar el preparador de las consultas sql.
    public static void cerrar(PreparedStatement st) {
        if (st != null) {
            try {
                st.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar el statement " + e);
            }
        }
    }
    
    //Método para cerrar la conexión a la bd.
    public static void cerrar(Connection con) {
        if (con != null) {
            try {
                con.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar la conexión " + e);
            }
        }
    }

    //Método para cerrar el resultado de las consultas.
    public static void cerrar(ResultSet rs) {
        if (rs != null) {
            try {
                rs.close();
            } catch (SQLException e) {
                System.out.println("Error al cerrar el ResultSet " + e);
            }
        }
    }
}
