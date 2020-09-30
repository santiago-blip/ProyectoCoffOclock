/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDAO;

import Clases.Encriptar;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author santi
 */
public class RecuperarDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public int generarCodigo(String usuario, String code) {
        int resultado = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("UPDATE tbl_usuarios SET Codigo_Usuario = ? WHERE CorreoElectronico_Usuario =?");
            st.setString(1, code);
            st.setString(2, usuario);
            resultado = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("No se pudo recuperar la contraseña por: " + e);
        }
        return resultado;
    }

    public void cambiarPass(String correo, String pass) {
        Encriptar enc = new Encriptar();
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("UPDATE tbl_usuarios SET Contrasena_Usuario = ?, Codigo_Usuario = ? WHERE CorreoElectronico_Usuario =?");
            st.setString(1, enc.encriptar(pass));
            st.setString(2, "0");
            st.setString(3, correo);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("No se pudo cambiar la contraseña por: " + e);
        }
    }

}
