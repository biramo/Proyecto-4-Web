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

            // Activamos el cambio de imagenes despues de pintar el producto
            activarGaleriaProducto();
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

    // Obtenemos las imagenes del producto
    const imagenes = producto.getElementsByTagName("imagen");

    // Imagen principal por defecto
    let imagenPrincipal = "";

    // Miniaturas de imagenes
    let miniaturas = "";

    // Recorremos las imagenes del producto
    for (let imagen of imagenes) {
        const rutaImagen = imagen.textContent;
        const esPrincipal = imagen.getAttribute("principal");

        // Si es la imagen principal, la usamos como imagen grande inicial
        if (esPrincipal === "si") {
            imagenPrincipal = rutaImagen;
        }

        // Creamos cada miniatura
        miniaturas += `
            <button class="producto_miniatura_btn" type="button" data-img="${rutaImagen}">
                <img class="producto_miniatura_img" src="${rutaImagen}" alt="${obtenerTexto(producto, "nombre_comercial")}">
            </button>
        `;
    }

    // Si por algun motivo no hay imagen marcada como principal, usamos la primera
    if (!imagenPrincipal && imagenes.length > 0) {
        imagenPrincipal = imagenes[0].textContent;
    }

    return `
        <div class="producto_detalle">

            <div class="producto_galeria">
                <div class="producto_img_principal_box">
                    <img 
                        id="producto_img_principal"
                        class="producto_img_principal" 
                        src="${imagenPrincipal}" 
                        alt="${obtenerTexto(producto, "nombre_comercial")}"
                    >
                </div>

                <div class="producto_miniaturas">
                    ${miniaturas}
                </div>
            </div>

            <div class="producto_info_single">

                <p class="producto_categoria">
                    ${obtenerCaracteristica(producto, "categoria")}
                </p>

                <h2 class="producto_titulo_single">
                    ${obtenerTexto(producto, "nombre_comercial")}
                </h2>

                <p class="producto_marca_single">
                    ${obtenerTexto(producto, "marca")}
                </p>

                <p class="producto_desc_single">
                    ${obtenerTexto(producto, "descripcion_corta")}
                </p>

                <div class="producto_precio_single">
                    ${obtenerTexto(producto, "precio")} EUR
                </div>

                <div class="producto_datos_single">
                    <p><strong>Referencia:</strong> ${obtenerTexto(producto, "referencia")}</p>
                    <p><strong>Tipo:</strong> ${producto.getAttribute("tipo")}</p>
                    <p><strong>Material:</strong> ${obtenerCaracteristica(producto, "material")}</p>
                    <p><strong>Color:</strong> ${obtenerCaracteristica(producto, "color")}</p>
                    <p><strong>Alto:</strong> ${obtenerCaracteristica(producto, "alto")} cm</p>
                    <p><strong>Largo:</strong> ${obtenerCaracteristica(producto, "largo")} cm</p>
                    <p><strong>Ancho:</strong> ${obtenerCaracteristica(producto, "ancho")} cm</p>
                    <p><strong>Disponibilidad:</strong> ${obtenerTexto(producto, "disponibilidad")}</p>
                    <p><strong>Tiempo de entrega:</strong> ${obtenerTexto(producto, "tiempo_entrega")} dias</p>
                </div>

                <div class="producto_acciones">
                    <a class="producto_boton_single" href="xml/llar_online.xml">
                        Volver al catalogo
                    </a>
                </div>

            </div>
        </div>
    `;
}


// Esta funcion activa el cambio de imagen principal al pulsar una miniatura
function activarGaleriaProducto() {

    // Buscamos la imagen principal
    const imagenPrincipal = document.getElementById("producto_img_principal");

    // Buscamos todos los botones de miniatura
    const botonesMiniatura = document.querySelectorAll(".producto_miniatura_btn");

    // Si no existe la imagen principal, no hacemos nada
    if (!imagenPrincipal) {
        return;
    }

    // Recorremos todas las miniaturas
    botonesMiniatura.forEach(function (boton) {

        // Al hacer click en una miniatura cambiamos la imagen principal
        boton.addEventListener("click", function () {
            const nuevaImagen = boton.getAttribute("data-img");

            imagenPrincipal.setAttribute("src", nuevaImagen);

            // Quitamos la clase activa de todas las miniaturas
            botonesMiniatura.forEach(function (btn) {
                btn.classList.remove("active");
            });

            // Marcamos como activa la miniatura pulsada
            boton.classList.add("active");
        });
    });

    // Marcamos la primera miniatura como activa por defecto
    if (botonesMiniatura.length > 0) {
        botonesMiniatura[0].classList.add("active");
    }
}


// Esta funcion obtiene el texto de una etiqueta del producto
// Por ejemplo: marca, referencia, precio, disponibilidad...
function obtenerTexto(producto, etiqueta) {
    const elemento = producto.getElementsByTagName(etiqueta)[0];

    // Si la etiqueta existe, devuelve su texto. Si no existe, devuelve vacio.
    return elemento ? elemento.textContent : "";
}


// Esta funcion obtiene el texto de una caracteristica concreta
// Por ejemplo: material, color, alto, largo, ancho, categoria...
function obtenerCaracteristica(producto, nombreCaracteristica) {
    const caracteristicas = producto.getElementsByTagName("caracteristica");

    // Recorremos todas las caracteristicas del producto
    for (let caracteristica of caracteristicas) {
        if (caracteristica.getAttribute("nombre") === nombreCaracteristica) {
            return caracteristica.textContent;
        }
    }

    // Si no encuentra la caracteristica, devuelve vacio
    return "";
}