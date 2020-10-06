package ClasesDAO;

import Clases.Carrito;
import Clases.Pedido;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidoDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;
    int r = 0;
    //Con este método se genera el pedido.
    public void generarPedido(Pedido p) {
        if(p.getCantidad_Producto()>0){
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("INSERT INTO tbl_pedidos (Identificador_Pedido,Id_Usuario,Codigo_pedido,Id_Producto,Nombre_Producto,Precio_Producto,Cantidad_Producto,Total_Producto,Estado_Pedido,Fecha_Pedido,Precio_Pedido) VALUES (?,?,?,?,?,?,?,?,?,?,?)");
            st.setInt(1, p.getIdentificador_Pedido());
            st.setInt(2, p.getId_Usuario());
            st.setString(3, p.getCodigo_pedido());
            st.setInt(4, p.getId_Producto());
            st.setString(5, p.getNombre_Producto());
            st.setDouble(6, p.getPrecio_Producto());
            st.setInt(7, p.getCantidad_Producto());
            st.setDouble(8, p.getTotal_Producto());
            st.setBoolean(9, p.isEstado_Pedido());
            st.setString(10, p.getFecha_Pedido());
            st.setDouble(11, p.getPrecio_Pedido());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println("No se puede ingresar el pedido por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
        }
    }
    }
    //Con este método traemos todos los productos del carrito de compras que concuerde con el usuario actual.
    public List<Carrito> SeleccionarCarro(int id) {
        List<Carrito> lista = new ArrayList<>();
        Carrito car;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_ccompras WHERE Id_Usuario = ?");
            st.setInt(1, id);
            rs = st.executeQuery();
            while (rs.next()) {
                car = new Carrito();
                car.setIdCarrito(rs.getInt("Id_Carrito"));
                car.setIdUsuario(rs.getInt("Id_Usuario"));
                car.setIdProducto(rs.getInt("Id_Producto"));
                car.setDescripcion_Producto(rs.getString("Descripcion_Producto"));
                car.setNombre_Producto(rs.getString("Nombre_Producto"));
                car.setPrecio_producto(rs.getDouble("Precio_Producto"));
                car.setCantidad_Producto(rs.getInt("Cantidad_Producto"));
                car.setPrecioPagar(rs.getDouble("Precio_Pagar"));
                lista.add(car);
            }
            //Ciclo para recorrer el carro de compras y ver que no hayan pedidos que exedan la cantidad de producto disponible.
            for (int i = 0; i < lista.size(); i++) {
                System.out.println("Entro al ciclo sí");
                st = con.prepareStatement("SELECT * FROM tbl_productos WHERE Id_Producto = ?");
                st.setInt(1, lista.get(i).getIdProducto());
                rs = st.executeQuery();
                if (rs.next()) {
                    if (lista.get(i).getCantidad_Producto() > rs.getInt("Cantidad_Producto")) {
                        lista.get(i).setCantidad_Producto(rs.getInt("Cantidad_Producto"));
                    }
                }
            }
        } catch (SQLException e) {
            System.out.println("No se pudo insertar el pedido por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return lista;
    }
    int ident;
    //Con este método traemos el último identificador que haya en la bd.
    public int ident() {
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_pedidos order by Identificador_Pedido desc limit 1");
            rs = st.executeQuery();
            if (rs.next()) {
                ident = rs.getInt("Identificador_Pedido");
            }
        } catch (SQLException e) {
            System.out.println("No se pudo traer el identificador por: " + e);
        } finally {
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
//        if(ident == 0){
//            ident = 1;
//        }
        return ident;
    }

}
