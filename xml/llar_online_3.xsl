<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="componentes.xsl"/>

    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta charset="UTF-8"/>
                <title>Llar Online - Fichas 1</title>
                <link rel="stylesheet" type="text/css" href="../css/estil.css"/>
                <link rel="icon" href="../img/logos/favicon.ico" type="image/x-icon"/>
                <script src="../js/menu_active.js"></script>
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
                                <h2 class="tit_sec_h2">Productos de las categorías Descanso y Exterior</h2>
                                <p class="tit_sec_txt"></p>
                                <p class="catalogo_total">
                                    Productos mostrados:
                                    <strong>
                                        <xsl:value-of select="count(/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Descanso' or caracteristicas/caracteristica[@nombre='categoria']='Exterior'])"/>
                                    </strong>
                                </p>
                            </div>
                            <div class="menu_cat">
                                <ul class="menu_cat_lista">
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#descanso">Descanso</a>
                                    </li>
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#exterior">Exterior</a>
                                    </li>
                                </ul>
                            </div>
                        </section>

                        <section class="bloque_ficha" id="descanso">
                            <h2 class="bloque_ficha_tit">Descanso</h2>

                            <div class="catalogo_grid">

                                <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Descanso']">
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

                        <section class="bloque_ficha" id="exterior">
                            <h2 class="bloque_ficha_tit">Exterior</h2>

                            <div class="catalogo_grid">

                                <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Exterior']">
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