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

    public void generarPedido(Pedido p){
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
            System.out.println("No se puede ingresar el pedido por: "+e);
        }
    }
    
    
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
        } catch (SQLException e) {
            System.out.println("No se pudo insertar el pedido por: " + e);
        }
        return lista;
    }
    int ident;
      public int ident(){
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT * FROM tbl_pedidos order by Identificador_Pedido desc limit 1");
            rs = st.executeQuery();
            if(rs.next()) {
              ident = rs.getInt("Identificador_Pedido");
            }
        } catch (SQLException e) {
            System.out.println("No se pudo traer el identificador por: " + e);
        }
//        if(ident == 0){
//            ident = 1;
//        }
        return ident;
    }
    
    

}
