package ClasesDAO;

import Clases.Pedido;
import Clases.*;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class VentasDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    //Método para traer la venta que se llevará ala bd.
    public Ventas venta(int identificador) {
        Ventas venta = null;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT Identificador_Pedido,Id_Pedido,Codigo_Pedido,Fecha_Pedido,Precio_Pedido FROM tbl_pedidos WHERE Identificador_Pedido = ?");
            st.setInt(1, identificador);
            rs = st.executeQuery();
            if (rs.next()) {
                venta = new Ventas(rs.getInt("Id_Pedido"), identificador, rs.getDouble("Precio_Pedido"), rs.getString("Codigo_Pedido"), rs.getString("Fecha_Pedido"));
            }
        } catch (SQLException e) {
            System.out.println("No se pudo traer el pedido por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return venta;
    }

    //Método para traer todos los productos del pedido.
    public List<Pedido> Listarventa(int identificador) {
        List<Pedido> lista = new ArrayList<>();
        Pedido p = null;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_pedidos WHERE Identificador_Pedido = ?");
            st.setInt(1, identificador);
            rs = st.executeQuery();
            while (rs.next()) {
                p = new Pedido();
                p.setCantidad_Producto(rs.getInt("Cantidad_Producto"));
                p.setCodigo_pedido(rs.getString("Codigo_Pedido"));
                p.setEstado_Pedido(rs.getBoolean("Estado_Pedido"));
                p.setFecha_Pedido(rs.getString("Fecha_Pedido"));
                p.setId_Pedido(rs.getInt("Id_Pedido"));
                p.setId_Usuario(rs.getInt("Id_Usuario"));
                p.setIdentificador_Pedido(rs.getInt("Identificador_Pedido"));
                p.setNombre_Producto(rs.getString("Nombre_Producto"));
                p.setPrecio_Pedido(rs.getDouble("Precio_Pedido"));
                p.setPrecio_Producto(rs.getDouble("Precio_Producto"));
                p.setTotal_Producto(rs.getDouble("Total_Producto"));
                p.setId_Producto(rs.getInt("Id_Producto"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("No se pudo traer el pedido por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return lista;
    }

    //Método para hacer la venta, llenar el historial del pedido y eliminar el pedido ya pago.
    public int RelizarVenta(Ventas venta, List<Pedido> lista) {
        int resultado = 0;
        int cantidad = 1;
        try {
            con = Conexion.conexion();
            //Verífica que no haya un producto en 0
            for (int i = 0; i < lista.size(); i++) {
                st = con.prepareStatement("SELECT Cantidad_Producto FROM tbl_productos WHERE Id_Producto = ?");
                st.setInt(1, lista.get(i).getId_Producto());
                rs = st.executeQuery();
                if (rs.next()) {
                    cantidad = rs.getInt("Cantidad_Producto");
                    System.out.println("Cantidad de producto que trae en la vuelta  " + (i + 1) + " es " + cantidad);
                    if (cantidad == 0) {
                        break;
                    }
                }
            }
            System.out.println("Cantidad de producto que trae: " + cantidad);
            //actualizar cantidad de los productos
            if (cantidad > 0) {
                for (int i = 0; i < lista.size(); i++) {
                    st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Id_Producto = ?");
                    st.setInt(1, lista.get(i).getId_Producto());
                    rs = st.executeQuery();
                    if (rs.next()) {
                        cantidad = rs.getInt("Cantidad_Producto");
                        st = con.prepareStatement("UPDATE tbl_productos SET Cantidad_Producto = ? WHERE Id_Producto = ?");
                        st.setInt(1, cantidad - lista.get(i).getCantidad_Producto());
                        st.setInt(2, lista.get(i).getId_Producto());
                        st.executeUpdate();
                    }
                }
                //Borrar en tbl_pedidos 
                //Primero pasar al historial
                for (int i = 0; i < lista.size(); i++) {
                    st = con.prepareStatement("INSERT INTO Tbl_HistorialPedidos(Identificador_Pedido,Id_Pedido,Id_Usuario,Codigo_pedido,Id_Producto,Nombre_Producto,Precio_Producto,Cantidad_Producto,Total_Producto,Estado_Pedido,Fecha_Pedido,Precio_Pedido) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)");
                    st.setInt(1, lista.get(i).getIdentificador_Pedido());
                    st.setInt(2, lista.get(i).getId_Pedido());
                    st.setInt(3, lista.get(i).getId_Usuario());
                    st.setString(4, lista.get(i).getCodigo_pedido());
                    st.setInt(5, lista.get(i).getId_Producto());
                    st.setString(6, lista.get(i).getNombre_Producto());
                    st.setDouble(7, lista.get(i).getPrecio_Producto());
                    st.setInt(8, lista.get(i).getCantidad_Producto());
                    st.setDouble(9, lista.get(i).getTotal_Producto());
                    st.setBoolean(10, lista.get(i).isEstado_Pedido());
                    st.setString(11, lista.get(i).getFecha_Pedido());
                    st.setDouble(12, lista.get(i).getPrecio_Pedido());
                    st.executeUpdate();
                }
                //Insertar en tbl_ventas
                st = con.prepareStatement("INSERT INTO tbl_ventas (Id_Pedido,IdentificadorPedido,Total_Venta,Fecha_Venta,Codigo_Pedido) VALUES (?,?,?,?,?)");
                st.setInt(1, venta.getIdPedido());
                st.setInt(2, venta.getIdentificadorPedido());
                st.setDouble(3, venta.getTotalVenta());
                st.setString(4, venta.getFecha());
                st.setString(5, venta.getCodigoPedido());
                st.executeUpdate();
                
                
                //Ahora borra de pedidos
                st = con.prepareStatement("DELETE FROM tbl_pedidos WHERE Identificador_Pedido = ?");
                st.setInt(1, venta.getIdentificadorPedido());
                st.executeUpdate();
                resultado = 1;

                
                //Borrar del carro de compras si el producto de inventario está en 0
                st = con.prepareStatement("SELECT * FROM tbl_ccompras");
                Carrito c = new Carrito();
                CarritoDAO cDo = new CarritoDAO();
                List<Carrito> cLista = new ArrayList<>();
                rs = st.executeQuery();
                while (rs.next()) {
                    c.setIdProducto(rs.getInt("Id_Producto"));
                    c.setIdUsuario(rs.getInt("Id_Usuario"));
                    cLista.add(c);
                }
                //Ciclo para recorrer el carro de compras y ver que no hayan productos que estén agotados.
                for (int i = 0; i < cLista.size(); i++) {
                    st = con.prepareStatement("SELECT Cantidad_Producto FROM tbl_productos WHERE Id_Producto = ?");
                    st.setInt(1, cLista.get(i).getIdProducto());
                    rs = st.executeQuery();
                    if(rs.next()) {
                        System.out.println("Entro al if de que encontró");
                        System.out.println("El cantidad producto que trae es: " + rs.getInt("Cantidad_Producto"));
                        System.out.println("Cantidad de producto de: " + cLista.get(i).getNombre_Producto() + " es de: " + cLista.get(i).getCantidad_Producto());
                        if (rs.getInt("Cantidad_Producto") == 0) {
                           st = con.prepareStatement("DELETE FROM tbl_ccompras");
                           st.executeUpdate();
                        }
                    }
                }

            } else {
                resultado = 0;
            }
        } catch (SQLException e) {
            System.out.println("No se pudo hacer la venta por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return resultado;
    }

}
