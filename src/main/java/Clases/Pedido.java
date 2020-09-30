package Clases;

import java.util.List;


public class Pedido {
    private int Id_Pedido;
    private int Identificador_Pedido;
    private int Id_Usuario;
//    private int Id_Carrito;
    private String Codigo_pedido;
    private String Nombre_Producto;
    private double Precio_Producto;                  
    private int Cantidad_Producto;           
    private double Total_Producto;
    private boolean Estado_Pedido;         
    private String Fecha_Pedido;
    private double Precio_Pedido;
    private List<Pedido> lista;
    
    
    public Pedido() {
    }

    
    public Pedido(int Identificador_Pedido, int Id_Usuario, String Codigo_pedido, String Nombre_Producto, double Precio_Producto, int Cantidad_Producto, double Total_Producto, boolean Estado_Pedido, String Fecha_Pedido, double Precio_Pedido) {
        this.Identificador_Pedido = Identificador_Pedido;
        this.Id_Usuario = Id_Usuario;
        this.Codigo_pedido = Codigo_pedido;
        this.Nombre_Producto = Nombre_Producto;
        this.Precio_Producto = Precio_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
        this.Total_Producto = Total_Producto;
        this.Estado_Pedido = Estado_Pedido;
        this.Fecha_Pedido = Fecha_Pedido;
        this.Precio_Pedido = Precio_Pedido;
    }

    public int getId_Pedido() {
        return Id_Pedido;
    }

    public void setId_Pedido(int Id_Pedido) {
        this.Id_Pedido = Id_Pedido;
    }
    
    public int getIdentificador_Pedido() {
        return Identificador_Pedido;
    }

    public void setIdentificador_Pedido(int Identificador_Pedido) {
        this.Identificador_Pedido = Identificador_Pedido;
    }

    public int getId_Usuario() {
        return Id_Usuario;
    }

    public void setId_Usuario(int Id_Usuario) {
        this.Id_Usuario = Id_Usuario;
    }

//    public int getId_Carrito() {
//        return Id_Carrito;
//    }
//
//    public void setId_Carrito(int Id_Carrito) {
//        this.Id_Carrito = Id_Carrito;
//    }

    public String getCodigo_pedido() {
        return Codigo_pedido;
    }

    public void setCodigo_pedido(String Codigo_pedido) {
        this.Codigo_pedido = Codigo_pedido;
    }

    public String getNombre_Producto() {
        return Nombre_Producto;
    }

    public void setNombre_Producto(String Nombre_Producto) {
        this.Nombre_Producto = Nombre_Producto;
    }

    public double getPrecio_Producto() {
        return Precio_Producto;
    }

    public void setPrecio_Producto(double Precio_Producto) {
        this.Precio_Producto = Precio_Producto;
    }

    public int getCantidad_Producto() {
        return Cantidad_Producto;
    }

    public void setCantidad_Producto(int Cantidad_Producto) {
        this.Cantidad_Producto = Cantidad_Producto;
    }

    public double getTotal_Producto() {
        return Total_Producto;
    }

    public void setTotal_Producto(double Total_Producto) {
        this.Total_Producto = Total_Producto;
    }

    public boolean isEstado_Pedido() {
        return Estado_Pedido;
    }

    public void setEstado_Pedido(boolean Estado_Pedido) {
        this.Estado_Pedido = Estado_Pedido;
    }

    public String getFecha_Pedido() {
        return Fecha_Pedido;
    }

    public void setFecha_Pedido(String Fecha_Pedido) {
        this.Fecha_Pedido = Fecha_Pedido;
    }

    public double getPrecio_Pedido() {
        return Precio_Pedido;
    }

    public void setPrecio_Pedido(double Precio_Pedido) {
        this.Precio_Pedido = Precio_Pedido;
    }

    public List<Pedido> getLista() {
        return lista;
    }

    public void setLista(List<Pedido> lista) {
        this.lista = lista;
    }
                     
                     
                     
 
            }
    

    
