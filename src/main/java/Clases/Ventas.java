/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clases;

/**
 *
 * @author santi
 */
public class Ventas {
    private int idVentas;
    private int idPedido;
    private int identificadorPedido;
    private double totalVenta; 
    private String CodigoPedido;
    private String fecha;
    
    
    public Ventas(){
        
    }

    public Ventas(int idPedido, int identificadorPedido, double totalVenta, String CodigoPedido, String fecha) {
        this.idPedido = idPedido;
        this.identificadorPedido = identificadorPedido;
        this.totalVenta = totalVenta;
        this.CodigoPedido = CodigoPedido;
        this.fecha = fecha;
    }

    public int getIdVentas() {
        return idVentas;
    }

    public void setIdVentas(int idVentas) {
        this.idVentas = idVentas;
    }

    public int getIdPedido() {
        return idPedido;
    }

    public void setIdPedido(int idPedido) {
        this.idPedido = idPedido;
    }

    public int getIdentificadorPedido() {
        return identificadorPedido;
    }

    public void setIdentificadorPedido(int identificadorPedido) {
        this.identificadorPedido = identificadorPedido;
    }

    public double getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(double totalVenta) {
        this.totalVenta = totalVenta;
    }

    public String getCodigoPedido() {
        return CodigoPedido;
    }

    public void setCodigoPedido(String CodigoPedido) {
        this.CodigoPedido = CodigoPedido;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }
}
