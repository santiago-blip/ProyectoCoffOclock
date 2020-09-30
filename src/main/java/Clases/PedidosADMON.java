
package Clases;

import java.util.List;

public class PedidosADMON {
    private int identificadoPedido; //VA A LA BD
    private double totalVenta; //VA A LA BD
    private String fechaVenta; //VA A LA BD
    private int idPedido;     //VA A LA BD
    //SOLO INFORMACIÓN
    private String nombre; 
    private String apellido;
    private String cedula;
    private List<Pedido> lista;
    
    public PedidosADMON(){}

    public PedidosADMON(int identificadoPedido, double totalVenta, String fechaVenta, int idPedido, String nombre, String apellido, String cedula, List<Pedido> lista) {
        this.identificadoPedido = identificadoPedido;
        this.totalVenta = totalVenta;
        this.fechaVenta = fechaVenta;
        this.idPedido = idPedido;
        this.nombre = nombre;
        this.apellido = apellido;
        this.cedula = cedula;
        this.lista = lista;
    }

    public int getIdentificadoPedido() {
        return identificadoPedido;
    }

    public void setIdentificadoPedido(int identificadoPedido) {
        this.identificadoPedido = identificadoPedido;
    }

    public double getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(double totalVenta) {
        this.totalVenta = totalVenta;
    }

    public String getFechaVenta() {
        return fechaVenta;
    }

    public void setFechaVenta(String fechaVenta) {
        this.fechaVenta = fechaVenta;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCedula() {
        return cedula;
    }

    public void setCedula(String cedula) {
        this.cedula = cedula;
    }

    public List<Pedido> getLista() {
        return lista;
    }

    public void setLista(List<Pedido> lista) {
        this.lista = lista;
    }
    
}
