document.addEventListener("DOMContentLoaded", function() {
    cargarParte("header_box", "header.html");
    cargarParte("menu_box", "menu.html", activarMenuActual);
    cargarParte("footer_box", "footer.html");
});

function cargarParte(idContenedor, archivo, callback) {
    fetch(archivo)
        .then(function(respuesta) {
            return respuesta.text();
        })
        .then(function(html) {
            document.getElementById(idContenedor).innerHTML = html;

            if (callback) {
                callback();
            }
        })
        .catch(function(error) {
            console.error("Error cargando " + archivo, error);
        });
}