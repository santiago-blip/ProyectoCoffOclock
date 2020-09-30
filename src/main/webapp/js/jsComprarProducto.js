function comprarProd(Id_Pr) {
    if (confirm("¿Está Seguro de comprar este producto?")) {
        window.location.href = "ControllerCarrito?accion=comprarProducto&id=" + Id_Pr;
    }
}


