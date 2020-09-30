var abrirM = document.querySelectorAll(".imgbars")[0];
var menuC = document.querySelectorAll(".ulmenu")[0];
var menu = document.querySelectorAll(".uldesp")[0];

abrirM.addEventListener("click",function(e){
    e.preventDefault();
    menuC.style.display ="block";
    menu.classList.toggle("ulmen");
})

window.addEventListener("click",function(e){
    e.target
    if (e.target == menuC){
        menu.classList.toggle("ulmen");
        this.setTimeout(function(){
            menuC.style.display ="none";
        },500);
    }
})
window.addEventListener("resize",function(){
    menu.classList.toggle("ulmen");
    menuC.style.display ="none";
})