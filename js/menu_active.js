function activarMenuActual() {
    const rutaActual = window.location.pathname.split("/").pop() || "index.html";
    const enlaces = document.querySelectorAll(".menu_link");

    enlaces.forEach(function(enlace) {
        const href = enlace.getAttribute("href");

        if (!href) {
            return;
        }

        const rutaEnlace = href.split("/").pop();

        enlace.classList.remove("active");

        if (rutaActual === rutaEnlace) {
            enlace.classList.add("active");
        }
    });
}