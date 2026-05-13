/*
 * Muestra un aviso de cookies.
 * Si el usuario acepta, guardamos la respuesta en localStorage para que no vuelva a aparecer.
 */

document.addEventListener("DOMContentLoaded", function() {
    mostrarAvisoCookies();
});

function mostrarAvisoCookies() {

    // Comprobamos si el usuario ya acepto las cookies
    const cookiesAceptadas = localStorage.getItem("cookies_aceptadas");

    // Si ya acepto, no mostramos el aviso
    if (cookiesAceptadas === "si") {
        return;
    }

    // Creamos el contenedor principal del aviso
    const aviso = document.createElement("div");
    aviso.className = "cookies_aviso";

    // Creamos el contenido HTML del aviso
    aviso.innerHTML = `
        <div class="cookies_box">
            <div class="cookies_txt">
                <h2 class="cookies_titulo">Aviso de cookies</h2>
                <p>
                    Utilizamos cookies para mejorar la experiencia de navegación en Llar Online.
                    Al continuar navegando o pulsar en aceptar, aceptas su uso.
                </p>
            </div>

            <button class="cookies_btn" type="button" id="cookies_aceptar">
                Aceptar
            </button>
        </div>
    `;

    // Añadimos el aviso al final del body
    document.body.appendChild(aviso);

    // Buscamos el boton de aceptar
    const botonAceptar = document.getElementById("cookies_aceptar");

    // Cuando el usuario pulsa aceptar, guardamos la respuesta y ocultamos el aviso
    botonAceptar.addEventListener("click", function() {
        localStorage.setItem("cookies_aceptadas", "si");
        aviso.remove();
    });
}