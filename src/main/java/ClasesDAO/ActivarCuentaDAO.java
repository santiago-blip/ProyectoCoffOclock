package ClasesDAO;

import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ActivarCuentaDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;



    public int activarCuenta(String user, String code) {
        int activar = 0;
        System.out.println("Ya entró a actualizar");
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_usuarios WHERE CorreoElectronico_Usuario = ? AND Codigo_Usuario = ?");
            st.setString(1, user);
            st.setString(2, code);
            rs = st.executeQuery();
            if (rs.next()) {
                System.out.println("Encontró resultado");
                st = con.prepareStatement("UPDATE tbl_usuarios SET Estado_Usuario =?,Codigo_Usuario = ? WHERE CorreoElectronico_Usuario = ? AND Codigo_Usuario = ?");
                st.setBoolean(1, true);
                st.setString(2, "0");
                st.setString(3, user);
                st.setString(4, code);
                st.executeUpdate();
                activar = 1;
            }
        } catch (SQLException e) {
            System.out.println("No se pudo activar el usuario por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return activar;
    }

    public int RecuperarCuenta(String user, String code) {
        int realizado = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("UPDATE tbl_usuarios SET Codigo_Usuario = ? WHERE CorreoElectronico_Usuario = ? ");
            st.setString(1, code);
            st.setString(2, user);
            realizado = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("No se pudo activar el usuario por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
        return realizado;
    }
}
