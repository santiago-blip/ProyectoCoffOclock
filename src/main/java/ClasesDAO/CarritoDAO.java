package ClasesDAO;

import Clases.Carrito;
import Clases.Productos;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CarritoDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public List<Productos> listarProductos() {
        List<Productos> listado = new ArrayList();
        Productos p;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_productos");
            rs = st.executeQuery();
            while (rs.next()) {
                p = new Productos(rs.getInt("Id_Producto"), rs.getString("Descripcion_Producto"), rs.getString("Nombre_Producto"), rs.getString("Categoria_Producto"), rs.getDouble("Precio_Producto"), rs.getString("RutaImg_Producto"), rs.getInt("Cantidad_Producto"), rs.getString("FechaVen_Producto"));
                listado.add(p);
            }
        } catch (SQLException e) {
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return listado;
    }

    public Productos ProductoAgregar(int id) {
        Productos p = new Productos();
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Id_Producto = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                p.setIdProducto(rs.getInt("Id_Producto"));
                p.setDescripcion_Producto(rs.getString("Descripcion_Producto"));
                p.setNombre_Producto(rs.getString("Nombre_Producto"));
                p.setCategoria_Producto(rs.getString("Categoria_Producto"));
                p.setPrecio_Producto(rs.getDouble("Precio_Producto"));
                p.setRutaImg_Producto(rs.getString("RutaImg_Producto"));
                p.setCantidad_Producto(rs.getInt("Cantidad_Producto"));
                p.setFechaVen_Producto(rs.getString("FechaVen_Producto"));
            }
        } catch (SQLException e) {
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return p;
    }

    public void agregarCarroBD(Carrito c) {
        try {
            con = Conexion.conexion();
            int cantidad;
            double precioPagar = 0;
            st = con.prepareStatement("SELECT * FROM tbl_ccompras WHERE Id_Producto = ? AND Id_Usuario = ?");
            st.setInt(1, c.getIdProducto());
            st.setInt(2, c.getIdUsuario());
            rs = st.executeQuery();
            if (rs.next()) {
                precioPagar = 0;
                System.out.println("No se puede agregar el producto al carro");
                cantidad = rs.getInt("Cantidad_Producto") + 1;
                precioPagar = (rs.getDouble("Precio_Producto") * cantidad);
                this.ActualizarCantidadCC(cantidad, precioPagar, rs.getInt("Id_Producto"),c.getIdUsuario());
            } else {
                st = con.prepareStatement("INSERT INTO tbl_ccompras (Id_Usuario,Id_Producto,Descripcion_Producto,Nombre_Producto,Precio_Producto,Cantidad_Producto,Precio_Pagar,RutaImg_Producto) VALUES (?,?,?,?,?,?,?,?)");
                st.setInt(1, c.getIdUsuario());
                st.setInt(2, c.getIdProducto());
                st.setString(3, c.getDescripcion_Producto());
                st.setString(4, c.getNombre_Producto());
                st.setDouble(5, c.getPrecio_producto());
                st.setInt(6, c.getCantidad_Producto());
                st.setDouble(7, c.getPrecioPagar());
                st.setString(8, c.getRutaImg_Producto());
                st.executeUpdate();
            }
        } catch (SQLException e) {
            System.out.println("Error al insertar en el carrito " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
    }

    public List<Carrito> listarCarrito(int id) {
        Carrito car = null;
        List<Carrito> lista = new ArrayList<>();
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_ccompras WHERE Id_Usuario = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                car = new Carrito();
                car.setIdProducto(rs.getInt("Id_Producto"));
                car.setIdUsuario(rs.getInt("Id_Usuario"));
                car.setNombre_Producto(rs.getString("Nombre_Producto"));
                car.setDescripcion_Producto(rs.getString("Descripcion_Producto"));
                car.setPrecio_producto(rs.getDouble("Precio_Producto"));
                car.setRutaImg_Producto(rs.getString("RutaImg_Producto"));
                car.setCantidad_Producto(rs.getInt("Cantidad_Producto"));
                car.setPrecioPagar(rs.getDouble("Precio_Pagar"));
                lista.add(car);
            }
        } catch (SQLException e) {
            System.out.println("Error al insertar en el carrito " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return lista;
    }

    public void ActualizarCantidadCC(int cantidad, double precio, int idP,int idU) {
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("UPDATE tbl_ccompras SET Cantidad_Producto = ?, Precio_Pagar = ? WHERE Id_Producto = ? AND Id_Usuario = ?");
            st.setInt(1, cantidad);
            st.setDouble(2, precio);
            st.setInt(3, idP);
            st.setInt(4,idU);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al actualizar en el carrito " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
    }

    public void EliminarCarro(int idP,int idUser) {
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("DELETE FROM tbl_ccompras WHERE Id_Producto = ? AND Id_Usuario=?");
            st.setInt(1, idP);
            st.setInt(2, idUser);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al eliminar en el carrito " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
    }

}
