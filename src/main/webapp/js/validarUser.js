const formulario = document.getElementById('formulario');
const inputs = document.querySelectorAll('#formulario input');

const expresiones = {
    usuario: /^[a-zA-Z0-9\_\-]{4,16}$/, // Letras, numeros, guion y guion_bajo
    nombre: /^[a-zA-ZÀ-ÿ\s]{3,24}$/, // Letras y espacios, pueden llevar acentos.
    apellido: /^[a-zA-ZÀ-ÿ\s]{4,24}$/, // Letras y espacios, pueden llevar acentos.
    documento: /^\d{7,14}$/, // 7 a 14 numeros.
    correo: /^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/,
    password: /^.{4,100}$/           // 4 a 12 digitos.
};

const campos = {
    nombre: false,
    apellido: false,
    documento: false,
    correo: false,
    password: false
};

const validarFormulario = (e) => {
    switch (e.target.name) {
        case "nombre":
            validarCampo(expresiones.nombre, e.target, 'nombre');
            break;
        case "apellido":
            validarCampo(expresiones.apellido, e.target, 'apellido');
            break;
        case "documento":
            validarCampo(expresiones.documento, e.target, 'documento');
            break;
        case "correo":
            validarCampo(expresiones.correo, e.target, 'correo');
            break;
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
    const terminos = document.getElementById('terminos');
    if (campos.nombre && campos.apellido && campos.documento && campos.correo && campos.password) {
        document.getElementById('message-exitoso').classList.add('message-exitoso-activo');
        setTimeout(() => {
            document.getElementById('message-exitoso').classList.remove('message-exitoso-activo');
        }, 5000);
        document.querySelectorAll('.campo-valido').forEach((icono) => {
            icono.classList.remove('campo-valido');
        });
        document.getElementById('form-message').classList.remove('form-message-activo');
        formulario.submit();
        formulario.reset();
    } else {
        document.getElementById('form-message').classList.add('form-message-activo');
    }
});


