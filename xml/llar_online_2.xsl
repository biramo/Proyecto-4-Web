<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="componentes.xsl"/>

    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta charset="UTF-8"/>
                <title>Llar Online - Tabla por disponibilidad</title>
                <link rel="stylesheet" type="text/css" href="../css/estil.css"/>
            </head>

            <body class="pag_tabla">

                <div class="pag_wrap" id="inicio_tabla">

                    <xsl:call-template name="cabecera"/>
                    <xsl:call-template name="menu"/>

                    <main class="cont_tabla">

                        <div class="tit_sec">
                            <h2 class="tit_sec_h2">Productos por disponibilidad</h2>
                            <p class="tit_sec_txt">Listado del catálogo organizado según el estado de disponibilidad</p>
                        </div>

                        <div class="menu_cat">
                            <ul class="menu_cat_lista">
                                <li class="menu_cat_item">
                                    <a class="menu_cat_link" href="#disponible">Disponible</a>
                                </li>
                                <li class="menu_cat_item">
                                    <a class="menu_cat_link" href="#pocas_unidades">Pocas unidades</a>
                                </li>
                            </ul>
                        </div>

                        <div class="bloque_tabla" id="disponible">
                            <h2 class="bloque_tabla_tit">Disponible</h2>

                            <table class="tabla_prod">
                                <tr class="tabla_fila_head">
                                    <th class="tabla_col">Nombre</th>
                                    <th class="tabla_col">Marca</th>
                                    <th class="tabla_col">Referencia</th>
                                    <th class="tabla_col">Categoría</th>
                                    <th class="tabla_col">Tipo</th>
                                    <th class="tabla_col">Precio</th>
                                    <th class="tabla_col">Entrega</th>
                                    <th class="tabla_col">Destacado</th>
                                </tr>

                                <xsl:for-each select="/llar_online/productos/producto[disponibilidad='Disponible']">
                                    <xsl:sort select="nombre_comercial" order="ascending"/>

                                    <tr class="tabla_fila">
                                        <td class="tabla_td"><xsl:value-of select="nombre_comercial"/></td>
                                        <td class="tabla_td"><xsl:value-of select="marca"/></td>
                                        <td class="tabla_td"><xsl:value-of select="referencia"/></td>
                                        <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='categoria']"/></td>
                                        <td class="tabla_td"><xsl:value-of select="@tipo"/></td>
                                        <td class="tabla_td">
                                            <xsl:value-of select="precio"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="precio/@moneda"/>
                                        </td>
                                        <td class="tabla_td">
                                            <xsl:value-of select="tiempo_entrega"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="tiempo_entrega/@unidad"/>
                                        </td>
                                        <td class="tabla_td">
                                            <xsl:choose>
                                                <xsl:when test="@destacado='si'">Sí</xsl:when>
                                                <xsl:otherwise>No</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>

                            <p class="volver_top">
                                <a class="volver_top_link" href="#inicio_tabla">Volver arriba</a>
                            </p>
                        </div>

                        <div class="bloque_tabla" id="pocas_unidades">
                            <h2 class="bloque_tabla_tit">Pocas unidades</h2>

                            <table class="tabla_prod">
                                <tr class="tabla_fila_head">
                                    <th class="tabla_col">Nombre</th>
                                    <th class="tabla_col">Marca</th>
                                    <th class="tabla_col">Referencia</th>
                                    <th class="tabla_col">Categoría</th>
                                    <th class="tabla_col">Tipo</th>
                                    <th class="tabla_col">Precio</th>
                                    <th class="tabla_col">Entrega</th>
                                    <th class="tabla_col">Destacado</th>
                                </tr>

                                <xsl:for-each select="/llar_online/productos/producto[disponibilidad='Pocas unidades']">
                                    <xsl:sort select="nombre_comercial" order="ascending"/>

                                    <tr class="tabla_fila">
                                        <td class="tabla_td"><xsl:value-of select="nombre_comercial"/></td>
                                        <td class="tabla_td"><xsl:value-of select="marca"/></td>
                                        <td class="tabla_td"><xsl:value-of select="referencia"/></td>
                                        <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='categoria']"/></td>
                                        <td class="tabla_td"><xsl:value-of select="@tipo"/></td>
                                        <td class="tabla_td">
                                            <xsl:value-of select="precio"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="precio/@moneda"/>
                                        </td>
                                        <td class="tabla_td">
                                            <xsl:value-of select="tiempo_entrega"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="tiempo_entrega/@unidad"/>
                                        </td>
                                        <td class="tabla_td">
                                            <xsl:choose>
                                                <xsl:when test="@destacado='si'">Sí</xsl:when>
                                                <xsl:otherwise>No</xsl:otherwise>
                                            </xsl:choose>
                                        </td>
                                    </tr>
                                </xsl:for-each>
                            </table>

                            <p class="volver_top">
                                <a class="volver_top_link" href="#inicio_tabla">Volver arriba</a>
                            </p>
                        </div>

                    </main>

                    <xsl:call-template name="footer"/>

                </div>

            </body>
        </html>

    </xsl:template>

</xsl:stylesheet>