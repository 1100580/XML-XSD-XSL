<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/Bicicletas">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/listagembicicletas.css" />
            </head>
            <body>
                <h3>Listagem de Bicicletas</h3>
                <table align="center">
                    <tr>
                        <th>Nome</th>
                        <th>Marca</th>
                        <th>Modelo</th>
                        <th>Preco</th>
                        <th>Quantidade</th>
                        <th>Componentes</th>
                    </tr>
                    <xsl:apply-templates select="Bicicleta">
                        <xsl:sort select="preco" order="ascending"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    
    
    <xsl:template match="Bicicleta">
        <tr>
            <td>
                <xsl:value-of select="@name" />
            </td>
            <td>
                <xsl:value-of select="marca" />
            </td>
            <td>
                <xsl:value-of select="modelo" />
            </td>
            <td>
                <xsl:value-of select="preco" />
            </td>
            <td>
                <xsl:value-of select="quantidade" />
            </td>
            <td>
                <xsl:apply-templates select="Comps" />
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="Comps">
        <table align="center">
            <tr>
                <th>Nome</th>
                <th>Preço</th>
            </tr>
            <xsl:apply-templates select="Comp"/>
        </table>
    </xsl:template>
   
    <xsl:template match="Comp">
        <tr>
            <td>
                <xsl:value-of select="@nome"/> 
            </td>
            <td>
                <xsl:value-of select="@preco"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet> 