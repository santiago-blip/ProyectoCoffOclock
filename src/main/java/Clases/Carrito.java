package Clases;

public class Carrito {
    private int item;
    private int idCarrito;
    private int idUsuario;
    private int idProducto;
    private String Descripcion_Producto;
    private String Nombre_Producto;
    private double Precio_producto;
    private double PrecioPagar;
    private String RutaImg_Producto;
    private int Cantidad_Producto;

    public Carrito() {
    }

    public Carrito(int item, int idUsuario, int idProducto, String Descripcion_Producto, String Nombre_Producto, double Precio_total, double PrecioPagar, String RutaImg_Producto, int Cantidad_Producto) {
        this.item = item;
        this.idUsuario = idUsuario;
        this.idProducto = idProducto;
        this.Descripcion_Producto = Descripcion_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Precio_producto = Precio_total;
        this.PrecioPagar = PrecioPagar;
        this.RutaImg_Producto = RutaImg_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
    }

    public int getIdCarrito() {
        return idCarrito;
    }

    public void setIdCarrito(int idCarrito) {
        this.idCarrito = idCarrito;
    }
    
    
    
    public Carrito(int item, int idProducto, String Descripcion_Producto, String Nombre_Producto, double Precio_total, String RutaImg_Producto, int Cantidad_Producto) {
        this.item = item;
        this.idProducto = idProducto;
        this.Descripcion_Producto = Descripcion_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Precio_producto = Precio_total;
        this.RutaImg_Producto = RutaImg_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }
    
    public double getPrecioPagar() {
        return PrecioPagar;
    }

    public void setPrecioPagar(double PrecioPagar) {
        this.PrecioPagar = PrecioPagar;
    }

    public void setItem(int item) {
        this.item = item;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public void setDescripcion_Producto(String Descripcion_Producto) {
        this.Descripcion_Producto = Descripcion_Producto;
    }

    public void setNombre_Producto(String Nombre_Producto) {
        this.Nombre_Producto = Nombre_Producto;
    }

    public void setPrecio_producto(double Precio_producto) {
        this.Precio_producto = Precio_producto;
    }

    public void setRutaImg_Producto(String RutaImg_Producto) {
        this.RutaImg_Producto = RutaImg_Producto;
    }

    public void setCantidad_Producto(int Cantidad_Producto) {
        this.Cantidad_Producto = Cantidad_Producto;
    }

    public int getItem() {
        return item;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public String getDescripcion_Producto() {
        return Descripcion_Producto;
    }

    public String getNombre_Producto() {
        return Nombre_Producto;
    }

    public double getPrecio_producto() {
        return Precio_producto;
    }

    public String getRutaImg_Producto() {
        return RutaImg_Producto;
    }

    public int getCantidad_Producto() {
        return Cantidad_Producto;
    }
    
    
}
