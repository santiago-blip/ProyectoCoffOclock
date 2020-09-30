package Clases;

public class Productos {
    private int idProducto;
    private String Descripcion_Producto;
    private String Nombre_Producto;
    private String Categoria_Producto;
    private double Precio_Producto;
    private String RutaImg_Producto;
    private int Cantidad_Producto;
    private String FechaVen_Producto;
    
    public Productos(){}

    public Productos(String Descripcion_Producto, String Nombre_Producto, String Categoria_Producto, double Precio_Producto, String RutaImg_Producto, int Cantidad_Producto, String FechaVen_Producto) {
        this.Descripcion_Producto = Descripcion_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Categoria_Producto = Categoria_Producto;
        this.Precio_Producto = Precio_Producto;
        this.RutaImg_Producto = RutaImg_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
        this.FechaVen_Producto = FechaVen_Producto;
    }
    
    public Productos(int idProducto, String Descripcion_Producto, String Nombre_Producto, String Categoria_Producto, double Precio_Producto, String RutaImg_Producto, int Cantidad_Producto, String FechaVen_Producto) {
        this.idProducto = idProducto;
        this.Descripcion_Producto = Descripcion_Producto;
        this.Nombre_Producto = Nombre_Producto;
        this.Categoria_Producto = Categoria_Producto;
        this.Precio_Producto = Precio_Producto;
        this.RutaImg_Producto = RutaImg_Producto;
        this.Cantidad_Producto = Cantidad_Producto;
        this.FechaVen_Producto = FechaVen_Producto;
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

    public void setCategoria_Producto(String Categoria_Producto) {
        this.Categoria_Producto = Categoria_Producto;
    }

    public void setPrecio_Producto(double Precio_Producto) {
        this.Precio_Producto = Precio_Producto;
    }

    public void setRutaImg_Producto(String RutaImg_Producto) {
        this.RutaImg_Producto = RutaImg_Producto;
    }

    public void setCantidad_Producto(int Cantidad_Producto) {
        this.Cantidad_Producto = Cantidad_Producto;
    }

    public void setFechaVen_Producto(String FechaVen_Producto) {
        this.FechaVen_Producto = FechaVen_Producto;
    }

    public int getIdProducto() {
        return this.idProducto;
    }

    public String getDescripcion_Producto() {
        return this.Descripcion_Producto;
    }

    public String getNombre_Producto() {
        return this.Nombre_Producto;
    }

    public String getCategoria_Producto() {
        return this.Categoria_Producto;
    }

    public double getPrecio_Producto() {
        return this.Precio_Producto;
    }

    public String getRutaImg_Producto() {
        return this.RutaImg_Producto;
    }

    public int getCantidad_Producto() {
        return this.Cantidad_Producto;
    }

    public String getFechaVen_Producto() {
        return this.FechaVen_Producto;
    }
    
}
