/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDAO;

import Clases.Encriptar;
import Clases.Usuario;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author santi
 */
public class UsuariosDAO {
    Connection con = null;
    PreparedStatement st = null;
    ResultSet rs = null;
    Encriptar enc = new Encriptar();
    public int insertarUsuario(Usuario usuario){
        int res = 0;
        try {
        con = Conexion.conexion();
        st = con.prepareStatement("INSERT INTO tbl_usuarios (Id_Rol,Nombre_Usuario,Apellido_Usuario,TipoDocumento_Usuario,DocumentoIdentidad_Usuario,CorreoElectronico_Usuario,Contrasena_Usuario,Estado_Usuario,Codigo_Usuario) VALUES (?,?,?,?,?,?,?,?,?)");
        st.setInt(1, usuario.getId_Rol());
        st.setString(2, usuario.getNombre_Usuario());
        st.setString(3, usuario.getApellido_Usuario());
        st.setString(4, usuario.getTipoDocumento_Usuario());
        st.setString(5, usuario.getDocumentoIdentidad_Usuario());
        st.setString(6,usuario.getCorreoElectronico_Usuario());
        st.setString(7, enc.encriptar(usuario.getContrasena_Usuario()));
        st.setBoolean(8, usuario.isEstado_Usuario());
        st.setString(9, usuario.getCodigo());
        res = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar por... "+e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
        return res;
    }
    
    public int buscarCorreo(Usuario usuario){
        int resultado = 0;
        try{
        con = Conexion.conexion();
        st = con.prepareStatement("SELECT * FROM tbl_usuarios WHERE CorreoElectronico_Usuario =?");
        st.setString(1, usuario.getCorreoElectronico_Usuario());
        rs = st.executeQuery();
        if(rs.next()){
            resultado = 1;
        }
        }catch(SQLException e){
            System.out.println("Error al hacer la consulta del correo por: "+e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return resultado;
    }
    public int Login(Usuario usuario){
        int encontrado=0;
        int rol = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_usuarios WHERE CorreoElectronico_Usuario = ? and Contrasena_Usuario = ?");
            st.setString(1, usuario.getCorreoElectronico_Usuario());
            st.setString(2, enc.encriptar(usuario.getContrasena_Usuario()));
            rs = st.executeQuery();
            if(rs.next()){
                rol = rs.getInt("Id_Rol");
                if(rol == 2){
                encontrado=2;
                }else if(rol ==1 && rs.getBoolean("Estado_Usuario") == true){
                    encontrado = 1;
                }else if(rol == 1 && rs.getBoolean("Estado_Usuario") != true){
                    encontrado = 3;
                }
            }
        } catch (SQLException e) {
            System.out.println("Error al loguear: "+e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return encontrado;
    }
    public int idUsuario(Usuario usuario){
        int id = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_usuarios WHERE CorreoElectronico_Usuario = ? and Contrasena_Usuario = ?");
            st.setString(1, usuario.getCorreoElectronico_Usuario());
            st.setString(2, enc.encriptar(usuario.getContrasena_Usuario()));
            rs = st.executeQuery();
            if(rs.next()){
                id = rs.getInt("Id_Usuario");
            }
        } catch (SQLException e) {
            System.out.println("Error al encontrar el id: "+e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return id;
    }
}
