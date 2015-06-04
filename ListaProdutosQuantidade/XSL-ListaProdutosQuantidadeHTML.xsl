<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/Produtos">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/listaprodutos.css" />
            </head>
            <body>
                <h3>Listagem dos produtos</h3>
                <xsl:if test="count(Bicicletas/Bicicleta)>0">
                    <table align="center">
                        <tr>
                            <th>Nome</th>
                            <th>Marca</th>
                            <th>Modelo</th>
                            <th>Preço</th>
                            <th>Quantidade</th>
                            <th>Componentes</th>
                        </tr>
                        <xsl:apply-templates select="Bicicletas/Bicicleta">
                            <xsl:sort select="quantidade"/>
                        </xsl:apply-templates>
                    </table>
                </xsl:if>
                <br />
                <xsl:if test="count(Componentes/Componente)>0">
                    <table align="center">
                        <tr>
                            <th>Nome</th>
                            <th>Tipo</th>
                            <th>Codigo</th>
                            <th>Marca</th>
                            <th>Características</th>
                            <th>Fotografia</th>
                            <th>Preço</th>
                            <th>Quantidade</th>
                        </tr>
                        <xsl:apply-templates select="Componentes/Componente">
                            <xsl:sort select="quantidade"/>
                        </xsl:apply-templates>
                    </table>
                </xsl:if>
                <br />
                <xsl:if test="count(Acessorios/Acessorio)>0">
                    <table align="center">
                        <tr>
                            <th>Nome</th>
                            <th>Tipo</th>
                            <th>Codigo</th>
                            <th>Preço</th>
                            <th>Quantidade</th>
                        </tr>
                        <xsl:apply-templates select="Acessorios/Acessorio">
                            <xsl:sort select="quantidade"/>
                        </xsl:apply-templates>
                    </table>
                </xsl:if>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="Bicicletas/Bicicleta">
        <tr>
            <td>
                <xsl:value-of select="@name"/>
            </td>
            <td>
                <xsl:value-of select="marca"/>
            </td>
            <td>
                <xsl:value-of select="modelo"/>
            </td>
            <td>
                <xsl:value-of select="preco"/>
            </td>
            <td>
                <xsl:value-of select="quantidade"/>
            </td>
            <td>
                <table align="center">
                    <tr>
                        <th>Nome</th>
                        <th>Preço</th>
                    </tr>
                    <xsl:apply-templates select="Comps/Comp"/>
                </table>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="Comps/Comp">
        <tr>
            <td> 
                <xsl:value-of select="@nome"/>
            </td>
            <td> 
                <xsl:value-of select="@preco"/>
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="Componentes/Componente">
        <tr>
            <td>
                <xsl:value-of select="nome"/>
            </td>
            <td>
                <xsl:value-of select="tipo"/>
            </td>
            <td>
                <xsl:value-of select="codigo"/>
            </td>
            <td>
                <xsl:value-of select="marca"/>
            </td> 
            <td>
                <xsl:value-of select="caracteristicas"/>
            </td>
            <td>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:apply-templates select="fotografia"/>
                    </xsl:attribute>
                </xsl:element>
            </td>
            <td>
                <xsl:value-of select="preco/@valor"/>/
                <xsl:value-of select="preco/@tipo"/>
            </td>
            <td>
                <xsl:value-of select="quantidade"/>
            </td>
        </tr>
    </xsl:template>
    <xsl:template match="Acessorios/Acessorio">
        <tr>
            <td>
                <xsl:value-of select="nome"/>
            </td>
            <td>
                <xsl:value-of select="tipo"/>
            </td>
            <td>
                <xsl:value-of select="codigo"/>
            </td>
            <td>
                <xsl:value-of select="preco/@valor"/>/
                <xsl:value-of select="preco/@tipo"/>
            </td>
            <td>
                <xsl:value-of select="quantidade"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet> 