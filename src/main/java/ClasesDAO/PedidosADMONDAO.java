/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDAO;

import Clases.PedidosADMON;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PedidosADMONDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;
    //Este metodo trae todos los pedidos que se han realizado.
    public List<PedidosADMON> retornarTodo() {
        List<PedidosADMON> lista = new ArrayList<>();
        PedidosADMON p;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT DISTINCT  Identificador_Pedido,Nombre_Usuario,Apellido_Usuario,Codigo_Pedido,Fecha_Pedido FROM tbl_pedidos INNER JOIN tbl_usuarios ON tbl_pedidos.Id_Usuario = tbl_usuarios.Id_Usuario");
            rs = st.executeQuery();
            while (rs.next()) {
//                p = new Pedido(rs.getInt("Identificador_Pedido"),rs.getInt("Id_Usuario"),rs.getString("Codigo_Pedido"), rs.getString("Nombre_Producto"),rs.getDouble("Precio_Producto"),rs.getInt("Cantidad_Producto"), rs.getDouble("Total_Producto"), rs.getBoolean("Estado_Pedido"),rs.getString("Fecha_Pedido"),rs.getDouble("Precio_Pedido"));
//                p.setId_Pedido(rs.getInt("Id_Pedido"));
                p = new PedidosADMON();
                p.setCodigoPedido(rs.getString("Codigo_Pedido"));
                p.setNombre(rs.getString("Nombre_Usuario"));
                p.setApellido(rs.getString("Apellido_Usuario"));
                p.setIdentificadoPedido(rs.getInt("Identificador_Pedido"));
                p.setFechaVenta(rs.getString("Fecha_Pedido"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("No se puede traer los pedidos por : " + e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return lista;
    }

    //Este metodo trae solamente 1 pedido y el usuario que lo realizó.
    public List<PedidosADMON> retornarCliente(int identificador) {
        List<PedidosADMON> lista = new ArrayList<>(); 
        PedidosADMON p = null;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT Identificador_Pedido,Id_Pedido,Codigo_Pedido,Nombre_Producto,Precio_Producto,Cantidad_Producto,Total_Producto,Fecha_Pedido,Precio_Pedido,Nombre_Usuario,Apellido_Usuario,DocumentoIdentidad_Usuario FROM tbl_pedidos INNER JOIN tbl_usuarios ON tbl_pedidos.Id_Usuario = tbl_usuarios.Id_Usuario WHERE Identificador_Pedido = ?");
            st.setInt(1, identificador);
            rs = st.executeQuery();
            while (rs.next()) {
                p  = new PedidosADMON(identificador, rs.getDouble("Precio_Pedido"), rs.getString("Fecha_Pedido"), rs.getInt("Id_Pedido"), rs.getString("Nombre_Usuario"), rs.getString("Apellido_Usuario"),rs.getString("DocumentoIdentidad_Usuario"),rs.getString("Nombre_Producto"), rs.getDouble("Precio_Producto"),rs.getInt("Cantidad_Producto"), rs.getDouble("Total_Producto"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("No se puede traer los pedidos por : " + e);
        }finally{
            Conexion.cerrar(con);
            Conexion.cerrar(st);
            Conexion.cerrar(rs);
        }
        return lista;
    }
}
