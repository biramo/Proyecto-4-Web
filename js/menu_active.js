function activarMenuActual() {

    // Obtenemos el nombre del archivo actual desde la URL.
    // Si no hay nombre de archivo, usamos index.html por defecto
    const rutaActual = window.location.pathname.split("/").pop() || "index.html";

    // Buscamos todos los enlaces del menu principal y del submenu
    const enlaces = document.querySelectorAll(".menu_link, .submenu_link");

    // Recorremos todos los enlaces encontrados
    enlaces.forEach(function(enlace) {

        // Obtenemos el atributo href de cada enlace
        const href = enlace.getAttribute("href");

        // Si el enlace no tiene href, pasamos al siguiente
        if (!href) {
            return;
        }

        // Obtenemos solo el nombre del archivo del enlace
        const rutaEnlace = href.split("/").pop();

        // Quitamos la clase active antes de comprobar, asi evitamos que queden varios enlaces marcados.
        enlace.classList.remove("active");

        // Si el archivo actual coincide con el archivo del enlace, marcamos ese enlace como activo.
        if (rutaActual === rutaEnlace) {
            enlace.classList.add("active");

            // Si el enlace activo esta dentro de un submenu, tambien marcamos como activo el enlace padre.
            const itemPadre = enlace.closest(".menu_item_sub");

            if (itemPadre) {
                const linkPadre = itemPadre.querySelector(".menu_link");

                if (linkPadre) {
                    linkPadre.classList.add("active");
                }
            }
        }
    });
}

/*
 * Permite abrir y cerrar el submenu al hacer click.
 * Esto es necesario en movil porque no hay hover real.
 */
function activarSubmenus() {

    // Buscamos todos los botones que abren submenus
    const botonesSubmenu = document.querySelectorAll(".menu_boton_sub");

    // Recorremos todos los botones encontrados
    botonesSubmenu.forEach(function(boton) {

        // Cuando se hace click sobre el boton, abrimos o cerramos su submenu
        boton.addEventListener("click", function() {

            // Buscamos el elemento padre que contiene el boton y el submenu
            const itemPadre = boton.closest(".menu_item_sub");

            // Si no encontramos el padre, no hacemos nada
            if (!itemPadre) {
                return;
            }

            // Añadimos o quitamos la clase que muestra el submenu
            itemPadre.classList.toggle("submenu_abierto");
        });
    });
}