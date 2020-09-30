/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ClasesDAO;

import Clases.Pedido;
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

    public List<Pedido> retornarTodo() {
        List<Pedido> lista = new ArrayList<>();
        Pedido p;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT DISTINCT  Identificador_Pedido FROM tbl_pedidos");
            rs = st.executeQuery();
            while (rs.next()) {
//                p = new Pedido(rs.getInt("Identificador_Pedido"),rs.getInt("Id_Usuario"),rs.getString("Codigo_Pedido"), rs.getString("Nombre_Producto"),rs.getDouble("Precio_Producto"),rs.getInt("Cantidad_Producto"), rs.getDouble("Total_Producto"), rs.getBoolean("Estado_Pedido"),rs.getString("Fecha_Pedido"),rs.getDouble("Precio_Pedido"));
//                p.setId_Pedido(rs.getInt("Id_Pedido"));
                p = new Pedido();
                p.setIdentificador_Pedido(rs.getInt("Identificador_Pedido"));
                lista.add(p);
            }
        } catch (SQLException e) {
            System.out.println("No se puede traer los pedidos por : " + e);
        }
        return lista;
    }

//    public List<List> retornarPedidos(List<Pedido> list) {
//        List<List> lista = new ArrayList<>();
//        List<Pedido> listaSub;
//        Pedido p;
//        try {
//            con = Conexion.conexion();
//            for (int i = 0; i < list.size(); i++) {
//                listaSub = new ArrayList<>();
//                st = con.prepareStatement("SELECT * FROM tbl_pedidos WHERE Identificador_Pedido = ?");
//                st.setInt(1, list.get(i).getIdentificador_Pedido());
//                rs = st.executeQuery();
//                while (rs.next()) {
//                p = new Pedido(rs.getInt("Identificador_Pedido"),rs.getInt("Id_Usuario"),rs.getString("Codigo_Pedido"), rs.getString("Nombre_Producto"),rs.getDouble("Precio_Producto"),rs.getInt("Cantidad_Producto"), rs.getDouble("Total_Producto"), rs.getBoolean("Estado_Pedido"),rs.getString("Fecha_Pedido"),rs.getDouble("Precio_Pedido"));
//                p.setId_Pedido(rs.getInt("Id_Pedido"));
//                listaSub.add(p);
//                }
//                lista.add(listaSub);
//            }
//        } catch (SQLException e) {
//            System.out.println("No se puede traer los pedidos por : " + e);
//        }
//        return lista;
//    }
}
