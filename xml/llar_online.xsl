<?xml version="1.0" encoding="UTF-8"?>

<!--
    Hoja XSLT encargada de transformar el XML de productos
    en una pagina HTML con formato de catalogo.
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <!--
        Incluimos el archivo de componentes reutilizables.
        En componentes.xsl estan definidos el header, el menu y el footer.
    -->
    <xsl:include href="componentes.xsl"/>

    <!--
        Indicamos que la salida de esta transformacion sera HTML.
        indent="yes" ayuda a que el HTML generado salga mejor organizado.
    -->
    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <!--
        Template principal.
        match="/" significa que empieza la transformacion desde la raiz del XML.
    -->
    <xsl:template match="/">

        <html>
            <head>
                <!-- Hace que la pagina sea responsive en moviles -->
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>

                <!-- Codificacion de caracteres -->
                <meta charset="UTF-8"/>

                <title>Llar Online - Catálogo</title>

                <!-- Hoja de estilos principal del proyecto -->
                <link rel="stylesheet" type="text/css" href="../css/estil.css"/>

                <!-- Favicon de la web -->
                <link rel="icon" href="../img/logos/favicon.ico" type="image/x-icon"/>

                <!-- Script para marcar el enlace activo del menu -->
                <script src="../js/menu_active.js"></script>

                <!-- Script para mostrar el aviso de cookies -->
                <script src="../js/cookies.js"></script>
            </head>

            <body class="pag_catalogo">

                <!-- Contenedor general de la pagina -->
                <div class="pag_wrap" id="inicio_catalogo">

                    <!-- Llamamos al header desde componentes.xsl -->
                    <xsl:call-template name="cabecera"/>

                    <!-- Llamamos al menu desde componentes.xsl -->
                    <xsl:call-template name="menu"/>

                    <!-- Contenido principal del catalogo -->
                    <main class="catalogo">

                        <!-- Introduccion del catalogo -->
                        <section class="catalogo_intro">
                            <div class="tit_sec">
                                <h2 class="tit_sec_h2">Catálogo de productos</h2>
                                <p class="tit_sec_txt"> Descubre todos los productos disponibles en Llar Online.</p>
                            </div>

                            <!--
                                Mostramos el numero total de productos.
                                count() cuenta cuantos elementos producto hay dentro del XML.
                            -->
                            <p class="catalogo_total">
                                Productos mostrados:
                                <strong>
                                    <xsl:value-of select="count(/llar_online/productos/producto)"/>
                                </strong>
                            </p>
                        </section>

                        <!-- Grid donde se pintan todas las tarjetas de producto -->
                        <section class="catalogo_grid">

                            <!--
                                Recorremos todos los productos del XML.
                                Por cada producto se genera una tarjeta HTML.
                            -->
                            <xsl:for-each select="/llar_online/productos/producto">

                                <!-- Ordenamos primero por categoria -->
                                <xsl:sort select="caracteristicas/caracteristica[@nombre='categoria']" order="ascending"/>

                                <!-- Si coinciden en categoria, ordenamos tambien por nombre comercial -->
                                <xsl:sort select="nombre_comercial" order="ascending"/>

                                <!-- Tarjeta individual de producto -->
                                <article class="producto_card">

                                    <!-- Imagen del producto -->
                                    <div class="producto_img_wrap">

                                        <!--
                                            Si el atributo destacado del producto es "si",
                                            mostramos una etiqueta visual de Destacado.
                                        -->
                                        <xsl:if test="@destacado='si'">
                                            <span class="producto_badge">Destacado</span>
                                        </xsl:if>

                                        <!--
                                            Mostramos la imagen principal del producto.
                                            El atributo src se genera con la ruta guardada en el XML.
                                            Se añade ../ porque estamos dentro de la carpeta xml.
                                        -->
                                        <img class="producto_img" src="../{imagenes/imagen[@principal='si']}" alt="{nombre_comercial}"/>
                                    </div>

                                    <!-- Informacion textual del producto -->
                                    <div class="producto_body">

                                        <!-- Categoria del producto -->
                                        <p class="producto_categoria">
                                            <xsl:value-of select="caracteristicas/caracteristica[@nombre='categoria']"/>
                                        </p>

                                        <!-- Nombre comercial -->
                                        <h3 class="producto_nombre">
                                            <xsl:value-of select="nombre_comercial"/>
                                        </h3>

                                        <!-- Marca -->
                                        <p class="producto_marca">
                                            <xsl:value-of select="marca"/>
                                        </p>

                                        <!-- Descripcion corta -->
                                        <p class="producto_desc">
                                            <xsl:value-of select="descripcion_corta"/>
                                        </p>

                                        <!-- Datos secundarios: referencia y tipo -->
                                        <div class="producto_meta">
                                            <span class="producto_ref">
                                                Ref:
                                                <xsl:value-of select="referencia"/>
                                            </span>

                                            <!--
                                                El tipo no es una etiqueta, es un atributo del producto.
                                                Por eso se obtiene con @tipo.
                                            -->
                                            <span class="producto_tipo">
                                                <xsl:value-of select="@tipo"/>
                                            </span>

                                        </div>

                                        <!--
                                            Caracteristicas especiales.
                                            No todos los productos tienen estas caracteristicas,
                                            por eso comprobamos cada una con xsl:if.
                                        -->
                                        <div class="producto_extra">

                                            <!-- Mostramos la forma directamente -->
                                            <xsl:if test="caracteristicas/caracteristica[@nombre='forma']">
                                                <span class="producto_extra_item">
                                                    <xsl:value-of select="caracteristicas/caracteristica[@nombre='forma']"/>
                                                </span>
                                            </xsl:if>

                                            <!-- Mostramos el tipo de cama solo si existe -->
                                            <xsl:if test="caracteristicas/caracteristica[@nombre='tipodecama']">
                                                <span class="producto_extra_item">
                                                    <xsl:text>Cama </xsl:text>
                                                    <xsl:value-of select="caracteristicas/caracteristica[@nombre='tipodecama']"/>
                                                </span>
                                            </xsl:if>

                                            <!--
                                                Reposabrazos:
                                                Si el valor es "Si", mostramos "Con reposabrazos".
                                                Si el valor es "No", mostramos "Sin reposabrazos".
                                            -->
                                            <xsl:if test="caracteristicas/caracteristica[@nombre='reposabrazos']='Si'">
                                                <span class="producto_extra_item">
                                                    Con reposabrazos
                                                </span>
                                            </xsl:if>

                                            <xsl:if test="caracteristicas/caracteristica[@nombre='reposabrazos']='No'">
                                                <span class="producto_extra_item">
                                                    Sin reposabrazos
                                                </span>
                                            </xsl:if>

                                        </div>

                                        <!-- Parte inferior de la tarjeta: precio, stock y boton -->
                                        <div class="producto_footer">

                                            <div>
                                                <!-- Precio y moneda -->
                                                <p class="producto_precio">
                                                    <xsl:value-of select="precio"/>
                                                    <xsl:text> </xsl:text>
                                                    <xsl:value-of select="precio/@moneda"/>
                                                </p>

                                                <!-- Disponibilidad -->
                                                <p class="producto_stock">
                                                    <xsl:value-of select="disponibilidad"/>
                                                </p>
                                            </div>

                                            <!--
                                                Enlace a la pagina individual del producto.
                                                Pasamos el id por parametro en la URL.
                                                Ejemplo: producto.html?id=PR001
                                            -->
                                            <a class="producto_boton" href="../producto.html?id={@id}">
                                                Ver producto
                                            </a>

                                        </div>

                                    </div>

                                </article>

                            </xsl:for-each>

                        </section>

                    </main>

                    <!-- Llamamos al footer desde componentes.xsl -->
                    <xsl:call-template name="footer"/>

                    <!--
                        Llamamos a las funciones de JavaScript cuando el HTML ya esta cargado.

                        activarMenuActual():
                        Marca como activo el enlace del menu correspondiente a la pagina actual.

                        activarSubmenus():
                        Permite abrir/cerrar el submenu en dispositivos moviles.
                    -->
                    <script>
                        <xsl:text>
                            document.addEventListener("DOMContentLoaded", function() {
                                activarMenuActual();
                                activarSubmenus();
                            });
                        </xsl:text>
                    </script>

                </div>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>