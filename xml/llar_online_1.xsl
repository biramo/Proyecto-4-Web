<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:include href="componentes.xsl"/>

    <xsl:output method="html" version="4.0" encoding="UTF-8" indent="yes"/>

    <xsl:template match="/">

        <html>
            <head>
                <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
                <meta charset="UTF-8"/>
                <title>Llar Online - Tabla por categorías</title>
                <link rel="stylesheet" type="text/css" href="../css/estil.css"/>
                <link rel="icon" href="../img/logos/favicon.ico" type="image/x-icon" />
                <script src="../js/menu_active.js"></script>
            </head>

            <body class="pag_tabla">

                <div class="pag_wrap" id="inicio_tabla">
                    <!-- Llamamos al header -->
                    <xsl:call-template name="cabecera"/>
                    <!-- Llamamos al menu -->
                    <xsl:call-template name="menu"/>

                    <main class="cont_tabla">
                        <section class="productos_tablas">
                            <div class="tit_sec">
                                <h2 class="tit_sec_h2">Productos por categorías</h2>
                                <p class="tit_sec_txt">Listado general del catálogo organizado por categorías</p>
                            </div>

                            <div class="menu_cat">
                                <ul class="menu_cat_lista">
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#descanso">Descanso</a>
                                    </li>
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#exterior">Exterior</a>
                                    </li>
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#comedor">Comedor</a>
                                    </li>
                                    <li class="menu_cat_item">
                                        <a class="menu_cat_link" href="#almacenamiento">Almacenamiento</a>
                                    </li>
                                </ul>
                            </div>

                            <div class="bloque_tabla" id="descanso">
                                <h2 class="bloque_tabla_tit">Descanso</h2>

                                <table class="tabla_prod">
                                    <tr class="tabla_fila_head">
                                        <th class="tabla_col">Nombre</th>
                                        <th class="tabla_col">Marca</th>
                                        <th class="tabla_col">Referencia</th>
                                        <th class="tabla_col">Material</th>
                                        <th class="tabla_col">Color</th>
                                        <th class="tabla_col">Alto</th>
                                        <th class="tabla_col">Largo</th>
                                        <th class="tabla_col">Ancho</th>
                                        <th class="tabla_col">Precio</th>
                                        <th class="tabla_col">Disponibilidad</th>
                                        <th class="tabla_col">Entrega</th>
                                    </tr>

                                    <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Descanso']">
                                        <xsl:sort select="nombre_comercial" order="ascending"/>

                                        <tr class="tabla_fila">
                                            <td class="tabla_td"><a class="tabla_link" href="../producto.html?id={@id}"><xsl:value-of select="nombre_comercial"/></a></td>
                                            <td class="tabla_td"><xsl:value-of select="marca"/></td>
                                            <td class="tabla_td"><xsl:value-of select="referencia"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='material']"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='color']"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="precio"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="precio/@moneda"/>
                                            </td>
                                            <td class="tabla_td"><xsl:value-of select="disponibilidad"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="tiempo_entrega"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tiempo_entrega/@unidad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>

                            </div>

                            <div class="bloque_tabla" id="exterior">
                                <h2 class="bloque_tabla_tit">Exterior</h2>

                                <table class="tabla_prod">
                                    <tr class="tabla_fila_head">
                                        <th class="tabla_col">Nombre</th>
                                        <th class="tabla_col">Marca</th>
                                        <th class="tabla_col">Referencia</th>
                                        <th class="tabla_col">Material</th>
                                        <th class="tabla_col">Color</th>
                                        <th class="tabla_col">Alto</th>
                                        <th class="tabla_col">Largo</th>
                                        <th class="tabla_col">Ancho</th>
                                        <th class="tabla_col">Precio</th>
                                        <th class="tabla_col">Disponibilidad</th>
                                        <th class="tabla_col">Entrega</th>
                                    </tr>

                                    <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Exterior']">
                                        <xsl:sort select="nombre_comercial" order="ascending"/>

                                        <tr class="tabla_fila">
                                            <td class="tabla_td"><a class="tabla_link" href="../producto.html?id={@id}"><xsl:value-of select="nombre_comercial"/></a></td>
                                            <td class="tabla_td"><xsl:value-of select="marca"/></td>
                                            <td class="tabla_td"><xsl:value-of select="referencia"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='material']"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='color']"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="precio"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="precio/@moneda"/>
                                            </td>
                                            <td class="tabla_td"><xsl:value-of select="disponibilidad"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="tiempo_entrega"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tiempo_entrega/@unidad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>

                                <p class="volver_top">
                                    <a class="volver_top_link" href="#inicio_tabla">Volver arriba</a>
                                </p>
                            </div>

                            <div class="bloque_tabla" id="comedor">
                                <h2 class="bloque_tabla_tit">Comedor</h2>

                                <table class="tabla_prod">
                                    <tr class="tabla_fila_head">
                                        <th class="tabla_col">Nombre</th>
                                        <th class="tabla_col">Marca</th>
                                        <th class="tabla_col">Referencia</th>
                                        <th class="tabla_col">Material</th>
                                        <th class="tabla_col">Color</th>
                                        <th class="tabla_col">Alto</th>
                                        <th class="tabla_col">Largo</th>
                                        <th class="tabla_col">Ancho</th>
                                        <th class="tabla_col">Precio</th>
                                        <th class="tabla_col">Disponibilidad</th>
                                        <th class="tabla_col">Entrega</th>
                                    </tr>

                                    <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Comedor']">
                                        <xsl:sort select="nombre_comercial" order="ascending"/>

                                        <tr class="tabla_fila">
                                            <td class="tabla_td"><a class="tabla_link" href="../producto.html?id={@id}"><xsl:value-of select="nombre_comercial"/></a></td>
                                            <td class="tabla_td"><xsl:value-of select="marca"/></td>
                                            <td class="tabla_td"><xsl:value-of select="referencia"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='material']"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='color']"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="precio"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="precio/@moneda"/>
                                            </td>
                                            <td class="tabla_td"><xsl:value-of select="disponibilidad"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="tiempo_entrega"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tiempo_entrega/@unidad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>

                                <p class="volver_top">
                                    <a class="volver_top_link" href="#inicio_tabla">Volver arriba</a>
                                </p>
                            </div>

                            <div class="bloque_tabla" id="almacenamiento">
                                <h2 class="bloque_tabla_tit">Almacenamiento</h2>

                                <table class="tabla_prod">
                                    <tr class="tabla_fila_head">
                                        <th class="tabla_col">Nombre</th>
                                        <th class="tabla_col">Marca</th>
                                        <th class="tabla_col">Referencia</th>
                                        <th class="tabla_col">Material</th>
                                        <th class="tabla_col">Color</th>
                                        <th class="tabla_col">Alto</th>
                                        <th class="tabla_col">Largo</th>
                                        <th class="tabla_col">Ancho</th>
                                        <th class="tabla_col">Precio</th>
                                        <th class="tabla_col">Disponibilidad</th>
                                        <th class="tabla_col">Entrega</th>
                                    </tr>

                                    <xsl:for-each select="/llar_online/productos/producto[caracteristicas/caracteristica[@nombre='categoria']='Almacenamiento']">
                                        <xsl:sort select="nombre_comercial" order="ascending"/>

                                        <tr class="tabla_fila">
                                            <td class="tabla_td"><a class="tabla_link" href="../producto.html?id={@id}"><xsl:value-of select="nombre_comercial"/></a></td>
                                            <td class="tabla_td"><xsl:value-of select="marca"/></td>
                                            <td class="tabla_td"><xsl:value-of select="referencia"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='material']"/></td>
                                            <td class="tabla_td"><xsl:value-of select="caracteristicas/caracteristica[@nombre='color']"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='alto']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='largo']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="caracteristicas/caracteristica[@nombre='ancho']/@unidad"/>
                                            </td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="precio"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="precio/@moneda"/>
                                            </td>
                                            <td class="tabla_td"><xsl:value-of select="disponibilidad"/></td>
                                            <td class="tabla_td">
                                                <xsl:value-of select="tiempo_entrega"/>
                                                <xsl:text> </xsl:text>
                                                <xsl:value-of select="tiempo_entrega/@unidad"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>

                                <p class="volver_top">
                                    <a class="volver_top_link" href="#inicio_tabla">Volver arriba</a>
                                </p>
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