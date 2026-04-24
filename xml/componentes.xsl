<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

    <xsl:template name="cabecera">
        <header class="cabecera">
            <div class="cabecera_wrap">
                <p class="cabecera_marca">Llar Online</p>
                <h1 class="cabecera_titulo">Tienda online de hogar sostenible</h1>
                <p class="cabecera_texto">
                    Muebles, decoración y soluciones para el hogar con diseño funcional.
                </p>
            </div>
        </header>
    </xsl:template>

    <xsl:template name="menu">
        <nav class="menu">
            <ul class="menu_lista">
                <li class="menu_item">
                    <a class="menu_link" href="../index.html">Inicio</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="../sobre_nosotros.html">Sobre Nosotros</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="llar_online_1_tabla.xml">Productos tabla 1</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="llar_online_2_tabla.xml">Productos tabla 2</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="llar_online_3_ficha.xml">Productos ficha 1</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="llar_online_4_ficha.xml">Productos ficha 2</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="../blog.html">Blog</a>
                </li>
                <li class="menu_item">
                    <a class="menu_link" href="../contacto.html">Contacto</a>
                </li>
            </ul>
        </nav>
    </xsl:template>

    <xsl:template name="footer">
        <footer class="footer">
            <div class="footer_wrap">
                <p class="footer_txt">Llar Online - Proyecto de Lenguaje de Marcas</p>
                <p class="footer_txt">ASIX1 - Actividad XML, DTD, XSLT y web</p>
            </div>
        </footer>
    </xsl:template>

</xsl:stylesheet>