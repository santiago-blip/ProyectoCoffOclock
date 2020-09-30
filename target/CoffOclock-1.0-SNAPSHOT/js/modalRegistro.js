/*Modal de registro*/
var abrirRegistroo = document.querySelectorAll(".modalR")[0];
var abrirRegistro = document.querySelectorAll(".modalR")[1];
var abrirReg = document.querySelectorAll(".modalR")[2];
var modalR = document.querySelectorAll(".contenedor-modalR")[0];
var modalRC = document.querySelectorAll(".mimodalR")[0];


/*ABRE DESDE REGISTRO */
abrirRegistroo.addEventListener("click",function(e){
    e.preventDefault();
     modalR.style.visibility ="visible";
    modalRC.classList.toggle("modal-closeR");
})
/*FIN ABRE DESDE REGISTRO */

/*ESTE ABRE DESDE EL LOGIN*/
abrirRegistro.addEventListener("click",function(e){
    e.preventDefault();
    modalR.style.visibility ="visible";
    modalRC.classList.toggle("modal-closeR");
    var modalC = document.querySelectorAll(".mimodal")[0];
    var modal = document.querySelectorAll(".contenedor-modal")[0];
    modal.style.visibility = "hidden";
    modalC.classList.toggle("modal-close");
})
/*FIN ABRE DESDE LOGIN*/

/*ABRE DESDE REESTABLECER */
abrirReg.addEventListener("click",function(e){
    e.preventDefault();
    modalR.style.visibility = "visible";
    modalRC.classList.toggle("modal-closeR");
    var contG = document.querySelectorAll(".contenedor-reestablecer")[0];
    var conM = document.querySelectorAll(".modalRestablece")[0];
    contG.style.visibility = "hidden";
    conM.classList.toggle("restablece-close");
})
/*FIN ABRE DESDE REESTABLECER*/
window.addEventListener("click",function(e){
    console.log(e.target);
     if(e.target == modalR){
         modalRC.classList.toggle("modal-closeR");
         this.setTimeout(function(){
            modalR.style.visibility = "hidden"
        },500);
     }
})
/*FIN MODAL REGISTRO*/