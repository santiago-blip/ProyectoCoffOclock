var abrirL = document.querySelectorAll(".restablece")[0]; //Este es el de login
var abrirR = document.querySelectorAll(".restablece")[1]; //Este es el del registro
var contG = document.querySelectorAll(".contenedor-reestablecer")[0];
var conM = document.querySelectorAll(".modalRestablece")[0];

/*Este es el de login*/
abrirL.addEventListener("click",function(e){
    e.preventDefault();
    contG.style.visibility = "visible";
    conM.classList.toggle("restablece-close");
    var modal = document.querySelectorAll(".contenedor-modal")[0];
    var modalC = document.querySelectorAll(".mimodal")[0];
    modal.style.visibility ="hidden";
    modalC.classList.toggle("modal-close");
})
/*FIN FUNCION LOGIN*/

/*INICIO DE REGISTRO*/
// abrirR.addEventListener("click",function(e){
//     e.preventDefault();
//     contG.style.visibility = "visible";
//     contM.classList.toggle("restablece-close");
//     var modalR = document.querySelectorAll(".contenedor-modalR")[0];
//     var modalRC = document.querySelectorAll(".mimodalR")[0];
//     modalR.style.visibility = "hidden";
//     modalRC.classList.toggle("modal-closeR");
// })
/*FIN DE REGISTRO */
window.addEventListener("click",function(e){
    e.target
    if(e.target == contG){
        conM.classList.toggle("restablece-close");
        this.setTimeout(function(){
            contG.style.visibility = "hidden";
        },500);
    }
})

