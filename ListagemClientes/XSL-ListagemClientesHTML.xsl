<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/Clientes">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/listagemclientes.css" />
            </head>
            <body>
                <h3>Listagem de Clientes</h3>
                <table align="center">
                    <tr>
                        <th>Nome</th>
                        <th>Data de nascimento</th>
                        <th>BI</th>
                        <th>Email</th>
                        <th>Telefone</th>
                        <th>Fotografia</th>
                        <th>Compras</th>
                    </tr>
                    <xsl:apply-templates select="Cliente">
                        <xsl:sort select="Nome"/>
                    </xsl:apply-templates>
                </table>
            </body>
        </html>
    </xsl:template>
    
    <xsl:template match="Cliente">
        <tr>
            <td>
                <xsl:value-of select="DadosPessoais/Nome" />
            </td>
            <td>
                <xsl:value-of select="DadosPessoais/DataNascimento" />
            </td>
            <td>
                <xsl:value-of select="DadosPessoais/BI" />
            </td>
            <td>
                <xsl:value-of select="DadosPessoais/Email" />
            </td>
            <td>
                <xsl:value-of select="DadosPessoais/Telefone" />
            </td>
            <td>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:apply-templates select="Fotografia"/>
                    </xsl:attribute>
                </xsl:element>
            </td>
            <td>
                <xsl:apply-templates select="Compras" />
            </td>
        </tr>
    </xsl:template>
    
    <xsl:template match="Compras">
        <table align="center">
            <tr>
                <th>Nome</th>
                <th>Quantidade</th>
            </tr>
            <xsl:apply-templates select="Compra"/>
        </table>
    </xsl:template>
   
    <xsl:template match="Compra">
        <tr>
            <td>
                <xsl:value-of select="Nome"/> 
            </td>
            <td>
                <xsl:value-of select="Quantidade"/>
            </td>
        </tr>
    </xsl:template>
</xsl:stylesheet>