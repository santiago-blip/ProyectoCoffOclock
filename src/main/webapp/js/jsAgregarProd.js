function agregarProd(Id_Pr) {
//    if (confirm("¿Está Seguro de agregar el producto?")) {
//        window.location.href = "ControllerCarrito?accion=agregarCarro&id=" + Id_Pr;
//    }
swal({
  title: "¿Está Seguro de agregar el producto?",
  text: "Once deleted, you will not be able to recover this imaginary file!",
  icon: "info",
  buttons: true,
  dangerMode: true
})
.then((willDelete) => {
  if (willDelete) {
    swal("Su producto ha sido agregado", {
      icon: "success",
    }).then((willDelete)=>{
        if(willDelete){
            parent.location.href = "ControllerCarrito?accion=agregarCarro&id=" + Id_Pr;
        }
    });
  }
});
}


