var abrir = document.querySelectorAll(".iniciar")[0];
var abrirA = document.querySelectorAll(".iniciar")[1];
var abrirR = document.querySelectorAll(".iniciar")[2];
var modal = document.querySelectorAll(".contenedor-modal")[0];
var modalC = document.querySelectorAll(".mimodal")[0];

abrir.addEventListener("click",function(e){
    e.preventDefault();
    modal.style.visibility ="visible";
    modalC.classList.toggle("modal-close");
})

/*CERRAR REGISTRO Y ABRIR LOGIN */
abrirA.addEventListener("click",function(e){
    e.preventDefault();
    modal.style.visibility ="visible";
    modalC.classList.toggle("modal-close");
    var modalR = document.querySelectorAll(".contenedor-modalR")[0];
    var modalRC = document.querySelectorAll(".mimodalR")[0];
    modalR.style.visibility ="hidden";
    modalRC.classList.toggle("modal-closeR");
})
/*FIN CERRAR REGISTRO Y ABRIR LOGIN */
/* CERRAR REESTABLECER Y ABRIR LOGIN*/
abrirR.addEventListener("click",function(e){
    e.preventDefault();
    modal.style.visibility ="visible";
    modalC.classList.toggle("modal-close");
    var contG = document.querySelectorAll(".contenedor-reestablecer")[0];
    var conM = document.querySelectorAll(".modalRestablece")[0];
    contG.style.visibility = "hidden";
    conM.classList.toggle("restablece-close");
})
/*FIN CERRAR REESTABLECER Y ABRIR LOGIN */
window.addEventListener("click",function(e){
    e.target;
    if(e.target == modal){
        modalC.classList.toggle("modal-close");
        this.setTimeout(function(){
            modal.style.visibility = "hidden"
        },500);
    }
})





