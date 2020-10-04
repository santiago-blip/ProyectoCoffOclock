package ClasesDAO;

import Clases.Grafica;
import Model.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GraficasDAO {

    Connection con;
    PreparedStatement st;
    ResultSet rs;

    public List<Grafica> graficarVenta(int year) {
        List<Grafica> lista = new ArrayList<>();
        Grafica f;
        try {
            con = Conexion.conexion();

            for (int i = 1; i <= 12; i++) {
                f = new Grafica();
                st = con.prepareStatement("SELECT SUM(Total_Venta)   FROM tbl_ventas  WHERE MONTH(Fecha_Venta) = ? AND YEAR(Fecha_Venta) = ?");
                st.setInt(1, i);
                st.setInt(2, year);
                rs = st.executeQuery();
                if (rs.next()) {
                    f.setMes(i);
                    f.setYear(year);
                    f.setTotalGrafica(rs.getDouble("SUM(Total_Venta)"));
                    lista.add(f);
                }
            }
        } catch (SQLException e) {
            System.out.println("No se puede hacer la gráfica por : " + e);
        }
        return lista;
    }

    public List<Grafica> traerFechas() {
        List<Grafica> lista = new ArrayList<>();
        Grafica f;
        try {
            con = Conexion.conexion();
            st = con.prepareStatement("SELECT DISTINCT YEAR(Fecha_Venta) FROM tbl_ventas");
            rs = st.executeQuery();
            while(rs.next()){
                f = new Grafica();
                f.setRyear(rs.getInt("YEAR(Fecha_Venta)"));
                lista.add(f);
            }
        } catch (SQLException e) {
            System.out.println("No se pudo traer los años por: "+e);
        }
        return lista;
    }

}
