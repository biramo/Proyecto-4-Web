<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="componentes.xsl"/>

    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta charset="UTF-8"/>
                <title>Llar Online - Fichas 2</title>
                <link rel="stylesheet" type="text/css" href="../css/estil.css"/>
                <link rel="icon" href="../img/logos/favicon.ico" type="image/x-icon"/>
                <script src="../js/menu_active.js"></script>
                <script src="../js/cookies.js"></script>
            </head>

            <body class="pag_catalogo">

                <div class="pag_wrap" id="inicio_fichas">

                    <!-- Llamamos al header -->
                    <xsl:call-template name="cabecera"/>
                    <!-- Llamamos al menu -->
                    <xsl:call-template name="menu"/>

                    <main class="catalogo">

                        <section class="catalogo_intro">
                            <div class="tit_sec">
                                <h2 class="tit_sec_h2">Productos de las categorías Comedor y Almacenamiento</h2>
                                <p class="tit_sec_txt"></p>
                                <p class="catalogo_total">
                                    Productos mostrados:
                                    <strong>
                                        <xsl:value-of select="count(/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Comedor' or caracteristicas/caracteristica[@nombre='categoria']='Almacenamiento'])"/>
                                    </strong>
                                </p>
                            </div>
                            <div class="menu_cat">
                                <ul class="menu_cat_lista">
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#comedor">Comedor</a>
                                    </li>
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#almacenamiento">Almacenamiento</a>
                                    </li>
                                </ul>
                            </div>
                        </section>

                        <section class="bloque_ficha" id="comedor">
                            <h2 class="bloque_ficha_tit">Comedor</h2>

                            <div class="catalogo_grid">

                                <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Comedor']">
                                    <xsl:sort select="marca" order="ascending"/>
                                    <xsl:sort select="nombre_comercial" order="ascending"/>

                                    <article class="producto_card">

                                        <div class="producto_img_wrap">
                                            <xsl:if test="@destacado='si'">
                                                <span class="producto_badge">Destacado</span>
                                            </xsl:if>

                                            <img class="producto_img" src="../{imagenes/imagen[@principal='si']}" alt="{nombre_comercial}"/>
                                        </div>

                                        <div class="producto_body">

                                            <p class="producto_categoria">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='categoria']"/>
                                            </p>

                                            <h3 class="producto_nombre">
                                                <xsl:value-of select="nombre_comercial"/>
                                            </h3>

                                            <p class="producto_marca">
                                                <xsl:value-of select="marca"/>
                                            </p>

                                            <p class="producto_desc">
                                                <xsl:value-of select="descripcion_corta"/>
                                            </p>

                                            <div class="producto_meta">
                                                <span class="producto_ref">
                                                    Ref:
                                                    <xsl:value-of select="referencia"/>
                                                </span>

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

                                            <div class="producto_footer">

                                                <div>
                                                    <p class="producto_precio">
                                                        <xsl:value-of select="precio"/>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="precio/@moneda"/>
                                                    </p>

                                                    <p class="producto_stock">
                                                        <xsl:value-of select="disponibilidad"/>
                                                    </p>
                                                </div>

                                                <a class="producto_boton" href="../producto.html?id={@id}">
                                                    Ver producto
                                                </a>

                                            </div>

                                        </div>

                                    </article>

                                </xsl:for-each>

                            </div>
                        </section>

                        <section class="bloque_ficha" id="almacenamiento">
                            <h2 class="bloque_ficha_tit">Almacenamiento</h2>

                            <div class="catalogo_grid">

                                <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Almacenamiento']">
                                    <xsl:sort select="marca" order="ascending"/>
                                    <xsl:sort select="nombre_comercial" order="ascending"/>

                                    <article class="producto_card">

                                        <div class="producto_img_wrap">
                                            <xsl:if test="@destacado='si'">
                                                <span class="producto_badge">Destacado</span>
                                            </xsl:if>

                                            <img class="producto_img" src="../{imagenes/imagen[@principal='si']}" alt="{nombre_comercial}"/>
                                        </div>

                                        <div class="producto_body">

                                            <p class="producto_categoria">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='categoria']"/>
                                            </p>

                                            <h3 class="producto_nombre">
                                                <xsl:value-of select="nombre_comercial"/>
                                            </h3>

                                            <p class="producto_marca">
                                                <xsl:value-of select="marca"/>
                                            </p>

                                            <p class="producto_desc">
                                                <xsl:value-of select="descripcion_corta"/>
                                            </p>

                                            <div class="producto_meta">
                                                <span class="producto_ref">
                                                    Ref:
                                                    <xsl:value-of select="referencia"/>
                                                </span>

                                                <span class="producto_tipo">
                                                    <xsl:value-of select="@tipo"/>
                                                </span>
                                            </div>

                                            <div class="producto_footer">

                                                <div>
                                                    <p class="producto_precio">
                                                        <xsl:value-of select="precio"/>
                                                        <xsl:text> </xsl:text>
                                                        <xsl:value-of select="precio/@moneda"/>
                                                    </p>

                                                    <p class="producto_stock">
                                                        <xsl:value-of select="disponibilidad"/>
                                                    </p>
                                                </div>

                                                <a class="producto_boton" href="../producto.html?id={@id}">
                                                    Ver producto
                                                </a>

                                            </div>

                                        </div>

                                    </article>

                                </xsl:for-each>

                            </div>
                        </section>

                    </main>

                    <!-- Llamamos al footer -->
                    <xsl:call-template name="footer"/>
                    <!-- Llamamos a la funcion del archivo menu active para que pinte el menu activo -->
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