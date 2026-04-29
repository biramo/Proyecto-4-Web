document.addEventListener("DOMContentLoaded", function() {
    cargarParte("header_box", "header.html");
    /* Paso 2 funciones en el callback para que una vez que cargue el archivo ... 
    marque activo el link del menu y ademas prepare el evento para mobile de hacer click */
    cargarParte("menu_box", "menu.html", function() {
        activarMenuActual();
        activarSubmenus();
    });
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