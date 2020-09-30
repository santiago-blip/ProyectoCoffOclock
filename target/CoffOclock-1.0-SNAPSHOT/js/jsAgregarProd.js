function agregarProd(Id_Pr) {
    if (confirm("¿Está Seguro de agregar el producto?")) {
        window.location.href = "ControllerCarrito?accion=agregarCarro&id=" + Id_Pr;
    }
}


