<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="componentes.xsl"/>

    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Llar Online - Fichas 1</title>
                <link rel="stylesheet" type="text/css" href="../css/estil.css"/>
            </head>

            <body class="pag_ficha">

                <div class="pag_wrap" id="inicio_fichas">

                    <xsl:call-template name="cabecera"/>
                    <xsl:call-template name="menu"/>

                    <main class="cont_ficha">

                        <div class="tit_sec">
                            <h2 class="tit_sec_h2">Fichas de productos</h2>
                            <p class="tit_sec_txt">Productos de las categorías Descanso y Exterior</p>
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

                        <div class="bloque_ficha" id="descanso">
                            <h2 class="bloque_ficha_tit">Descanso</h2>

                            <div class="ficha_lista">
                                <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Descanso']">
                                    <xsl:sort select="marca" order="ascending"/>
                                    <xsl:sort select="nombre_comercial" order="ascending"/>

                                    <div class="ficha_card">

                                        <div class="ficha_img_box">
                                            <img class="ficha_img" src="../{imagenes/imagen[@principal='si']}" alt="{nombre_comercial}"/>
                                        </div>

                                        <div class="ficha_info">
                                            <h3 class="ficha_nombre">
                                                <xsl:value-of select="nombre_comercial"/>
                                            </h3>

                                            <p class="ficha_txt">
                                                <strong>Marca:</strong>
                                                <xsl:value-of select="marca"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Referencia:</strong>
                                                <xsl:value-of select="referencia"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Tipo:</strong>
                                                <xsl:value-of select="@tipo"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Material:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='material']"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Color:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='color']"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Alto:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Largo:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Ancho:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Precio:</strong>
                                                <xsl:value-of select="precio"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="precio/@moneda"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Disponibilidad:</strong>
                                                <xsl:value-of select="disponibilidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Tiempo de entrega:</strong>
                                                <xsl:value-of select="tiempo_entrega"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tiempo_entrega/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Descripción:</strong>
                                                <xsl:value-of select="descripcion_corta"/>
                                            </p>

                                            <a class="ficha_boton" href="../producto.html?id={@id}">
                                                Ver producto
                                            </a>
                                        </div>

                                    </div>
                                </xsl:for-each>
                            </div>

                            <p class="volver_top">
                                <a class="volver_top_link" href="#inicio_fichas">Volver arriba</a>
                            </p>
                        </div>

                        <div class="bloque_ficha" id="exterior">
                            <h2 class="bloque_ficha_tit">Exterior</h2>

                            <div class="ficha_lista">
                                <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Exterior']">
                                    <xsl:sort select="marca" order="ascending"/>
                                    <xsl:sort select="nombre_comercial" order="ascending"/>

                                    <div class="ficha_card">

                                        <div class="ficha_img_box">
                                            <img class="ficha_img" src="../{imagenes/imagen[@principal='si']}" alt="{nombre_comercial}"/>
                                        </div>

                                        <div class="ficha_info">
                                            <h3 class="ficha_nombre">
                                                <xsl:value-of select="nombre_comercial"/>
                                            </h3>

                                            <p class="ficha_txt">
                                                <strong>Marca:</strong>
                                                <xsl:value-of select="marca"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Referencia:</strong>
                                                <xsl:value-of select="referencia"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Tipo:</strong>
                                                <xsl:value-of select="@tipo"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Material:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='material']"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Color:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='color']"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Alto:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Largo:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Ancho:</strong>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Precio:</strong>
                                                <xsl:value-of select="precio"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="precio/@moneda"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Disponibilidad:</strong>
                                                <xsl:value-of select="disponibilidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Tiempo de entrega:</strong>
                                                <xsl:value-of select="tiempo_entrega"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tiempo_entrega/@unidad"/>
                                            </p>

                                            <p class="ficha_txt">
                                                <strong>Descripción:</strong>
                                                <xsl:value-of select="descripcion_corta"/>
                                            </p>
                                        </div>

                                    </div>
                                </xsl:for-each>
                            </div>

                            <p class="volver_top">
                                <a class="volver_top_link" href="#inicio_fichas">Volver arriba</a>
                            </p>
                        </div>

                    </main>

                    <xsl:call-template name="footer"/>

                </div>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>