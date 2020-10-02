package ClasesDAO;

import Clases.Productos;
import Model.Conexion;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.FileItemFactory;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class ProductosDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public int insertarProducto(Productos p) {
        int resultado = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("INSERT INTO tbl_productos (Nombre_Producto,Descripcion_Producto,Categoria_Producto,Precio_Producto,RutaImg_Producto,Cantidad_Producto,FechaVen_Producto) VALUES (?,?,?,?,?,?,?)");
            st.setString(1, p.getNombre_Producto());
            st.setString(2, p.getDescripcion_Producto());
            st.setString(3, p.getCategoria_Producto());
            st.setDouble(4, p.getPrecio_Producto());
            st.setString(5, p.getRutaImg_Producto());
            st.setInt(6, p.getCantidad_Producto());
            st.setString(7, p.getFechaVen_Producto());
            resultado = st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al insertar por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
        return resultado;
    }

    public void actualizarProducto(Productos p) {
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("UPDATE tbl_productos SET Nombre_Producto = ?,Descripcion_Producto =?,Categoria_Producto =?,Precio_Producto = ?,RutaImg_Producto =?,Cantidad_Producto = ?,FechaVen_Producto =? WHERE Id_Producto = ?");
            st.setString(1, p.getNombre_Producto());
            st.setString(2, p.getDescripcion_Producto());
            st.setString(3, p.getCategoria_Producto());
            st.setDouble(4, p.getPrecio_Producto());
            st.setString(5, p.getRutaImg_Producto());
            st.setInt(6, p.getCantidad_Producto());
            st.setString(7, p.getFechaVen_Producto());
            st.setInt(8, p.getIdProducto());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("No se pudo actualizar el producto: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
    }

    public int buscarProducto(Productos p) {
        int resultado = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Nombre_Producto = ?");
            st.setString(1, p.getNombre_Producto());
            rs = st.executeQuery();
            if (rs.next()) {
                resultado = 2;
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar el producto por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return resultado;
    }

    public void eliminarProducto(int id) {
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_ccompras WHERE Id_Producto = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                st = con.prepareStatement("DELETE FROM tbl_ccompras WHERE Id_Producto = ?");
                st.setInt(1, id);
                st.executeUpdate();
            }
            st = con.prepareStatement("DELETE FROM tbl_productos WHERE Id_Producto = ?");
            st.setInt(1, id);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar por_: " + e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
    }

    public String TraerImagenNoBorrar(int id) {
        String ruta = null;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Id_Producto = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                ruta = rs.getString("RutaImg_Producto");
            }
        } catch (SQLException e) {
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return ruta;
    }

    public int ImagenNoBorrar(String ruta) {
        int resultado = 0;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_productos WHERE RutaImg_Producto = ?");
            st.setString(1, ruta);
            rs = st.executeQuery();
            while (rs.next()) {
                resultado++;
            }
        } catch (SQLException e) {
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return resultado;
    }

    public File buscarImgDelete(int id) {
        File archivo = null;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Id_Producto = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                archivo = new File("D:\\ProgramasDevops\\NetBeans\\CoffOclock\\src\\main\\webapp\\"+ rs.getString("RutaImg_Producto"));
                //archivo = new File("web\\" + rs.getString("RutaImg_Producto"));
            }
        } catch (SQLException e) {
            System.out.println("Error al buscar el archivo: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return archivo;
    }

}
