const formulario = document.getElementById('formularioRecuperar');
const inputs = document.querySelectorAll('#formularioRecuperar input');

const expresiones = {
    password: /^.{4,100}$/           // 4 a 12 digitos.
};

const campos = {
    password: false
};
const validarFormulario = (e) => {
    switch (e.target.name) {
        case "password":
            validarCampo(expresiones.password, e.target, 'password');
            validarPassword2();
            break;
        case "password2":
            validarPassword2();
            break;
    }
};

const validarCampo = (expresion, input, campo) => {
    if (expresion.test(input.value)) {
        document.getElementById(`grupo_${campo}`).classList.remove('campo-invalido');
        document.getElementById(`grupo_${campo}`).classList.add('campo-valido');
        document.querySelector(`#grupo_${campo} i`).classList.add('fa-check-circle');
        document.querySelector(`#grupo_${campo} i`).classList.remove('fa-times-circle');
        document.querySelector(`#grupo_${campo} .error`).classList.remove('error-activo');
        campos[campo] = true;
    } else {
        document.getElementById(`grupo_${campo}`).classList.add('campo-invalido');
        document.getElementById(`grupo_${campo}`).classList.remove('campo-valido');
        document.querySelector(`#grupo_${campo} i`).classList.add('fa-times-circle');
        document.querySelector(`#grupo_${campo} i`).classList.remove('fa-check-circle');
        document.querySelector(`#grupo_${campo} .error`).classList.add('error-activo');
        campos[campo] = false;
    }
};

const validarPassword2 = () => {
    const inputPassword1 = document.getElementById('password');
    const inputPassword2 = document.getElementById('password2');

    if (inputPassword1.value !== inputPassword2.value) {
        document.getElementById(`grupo_password2`).classList.add('campo-invalido');
        document.getElementById(`grupo_password2`).classList.remove('campo-valido');
        document.querySelector(`#grupo_password2 i`).classList.add('fa-times-circle');
        document.querySelector(`#grupo_password2 i`).classList.remove('fa-check-circle');
        document.querySelector(`#grupo_password2 .error`).classList.add('error-activo');
        campos['password'] = false;
    } else {
        document.getElementById(`grupo_password2`).classList.remove('campo-invalido');
        document.getElementById(`grupo_password2`).classList.add('campo-valido');
        document.querySelector(`#grupo_password2 i`).classList.remove('fa-times-circle');
        document.querySelector(`#grupo_password2 i`).classList.add('fa-check-circle');
        document.querySelector(`#grupo_password2 .error`).classList.remove('error-activo');
        campos['password'] = true;
    }
};

inputs.forEach((input) => {
    input.addEventListener('keyup', validarFormulario);
    input.addEventListener('blur', validarFormulario);
});


formulario.addEventListener('submit', (e) => {
    e.preventDefault();
    if (campos.password) {
        var pass = formulario['password'].value;
        var correo = formulario['correoC'].value;
        console.log("Esta es : "+pass);
        $.ajax({
            type: 'POST',
            url: "RecuperarPass?accion=cambiar",
            data: "pass=" + pass+"&CorreoCam="+correo,
            success: function (data, textStatus, jqXHR) {
                console.log("DATA Y CORREO: "+pass+correo)
                swal("Cambio la contraseña", {
                    icon: "success",
                }).then(()=>{
                    window.location.href = "index.jsp";
                });
            }
        });
    } else {
        document.getElementById('form-message').classList.add('form-message-activo');
    }
}); 
