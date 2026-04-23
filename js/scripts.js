document.addEventListener("DOMContentLoaded", function() {
    cargarParte("header_box", "header.html");
    cargarParte("menu_box", "menu.html");
    cargarParte("footer_box", "footer.html");
});

function cargarParte(idContenedor, archivo) {
    fetch(archivo)
        .then(function(respuesta) {
            return respuesta.text();
        })
        .then(function(html) {
            document.getElementById(idContenedor).innerHTML = html;
        })
        .catch(function(error) {
            console.error("Error cargando " + archivo, error);
        });
}