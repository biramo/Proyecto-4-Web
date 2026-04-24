// Esperamos a que cargue todo el HTML antes de ejecutar el codigo
document.addEventListener("DOMContentLoaded", function () {

    // Leemos el parametro "id" de la URL
    // Ejemplo: producto.html?id=PR001
    const params = new URLSearchParams(window.location.search);
    const idProducto = params.get("id");

    // Cargamos el XML y buscamos el producto con ese id
    cargarProducto("producto", "xml/llar_online.xml", idProducto);
});


// Esta funcion carga el archivo XML y busca el producto seleccionado
function cargarProducto(idContenedor, archivo, idProducto) {
    fetch(archivo)
        .then(function (respuesta) {
            // Convertimos la respuesta del archivo en texto
            console.log(respuesta);
            return respuesta.text();
        })
        .then(function (textoXml) {
            // Convertimos el texto del XML en un documento que JavaScript pueda leer
            const parser = new DOMParser();
            const xml = parser.parseFromString(textoXml, "text/xml");

            // Obtenemos todos los productos del XML
            const productos = xml.getElementsByTagName("producto");
            let html = "";

            // Recorremos los productos hasta encontrar el que tiene el id de la URL
            for (let producto of productos) {
                if (producto.getAttribute("id") === idProducto) {
                    html = crearFichaProducto(producto);
                }
            }

            // Pintamos la ficha dentro del contenedor HTML
            document.getElementById(idContenedor).innerHTML =
                html || "<p>Producto no encontrado.</p>";
        })
        .catch(function (error) {
            // Si hay algun problema al cargar el XML, mostramos error
            console.error("Error cargando " + archivo, error);
            document.getElementById(idContenedor).innerHTML =
                "<p>Error cargando el producto.</p>";
        });
}


// Esta funcion crea el HTML de la ficha del producto encontrado
function crearFichaProducto(producto) {
    return `
        <div class="producto_detalle">
            <div class="producto_img_box">
                <img 
                    class="producto_img" 
                    src="../${obtenerTexto(producto, "imagen")}" 
                    alt="${obtenerTexto(producto, "nombre_comercial")}"
                >
            </div>

            <div class="producto_info">
                <h2 class="producto_nombre">${obtenerTexto(producto, "nombre_comercial")}</h2>

                <p><strong>Marca:</strong> ${obtenerTexto(producto, "marca")}</p>
                <p><strong>Referencia:</strong> ${obtenerTexto(producto, "referencia")}</p>

                <!-- El tipo esta como atributo dentro de la etiqueta producto -->
                <p><strong>Tipo:</strong> ${producto.getAttribute("tipo")}</p>

                <p><strong>Precio:</strong> ${obtenerTexto(producto, "precio")} EUR</p>
                <p><strong>Disponibilidad:</strong> ${obtenerTexto(producto, "disponibilidad")}</p>
                <p><strong>Tiempo de entrega:</strong> ${obtenerTexto(producto, "tiempo_entrega")} dias</p>
                <p><strong>Descripcion:</strong> ${obtenerTexto(producto, "descripcion_corta")}</p>
            </div>
        </div>
    `;
}


// Esta funcion obtiene el texto de una etiqueta del producto
// Por ejemplo: marca, referencia, precio, disponibilidad...
function obtenerTexto(producto, etiqueta) {
    const elemento = producto.getElementsByTagName(etiqueta)[0];

    // Si la etiqueta existe, devuelve su texto. Si no existe, devuelve vacio.
    return elemento ? elemento.textContent : "";
}