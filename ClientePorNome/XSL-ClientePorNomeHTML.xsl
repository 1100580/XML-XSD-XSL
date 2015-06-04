<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:template match="/Cliente">
        <html>
            <head>
                <link rel="stylesheet" type="text/css" href="css/clientepornome.css" />
            </head>
            <body>
                <h3>Cliente</h3>
                <xsl:element name="img">
                    <xsl:attribute name="src">
                        <xsl:apply-templates select="Fotografia"/>
                    </xsl:attribute>
                </xsl:element>
                <p>Nome: 
                    <xsl:value-of select="DadosPessoais/Nome" /> 
                </p>
                <p>Data Nascimento: 
                    <xsl:value-of select="DadosPessoais/DataNascimento" /> 
                </p>
                <p>BI: 
                    <xsl:value-of select="DadosPessoais/BI" /> 
                </p>
                <p>Email: 
                    <xsl:value-of select="DadosPessoais/Email" /> 
                </p>
                <p>Telefone: 
                    <xsl:value-of select="DadosPessoais/Telefone" /> 
                </p>
                <p>Compras:</p>
                <xsl:apply-templates select="Compras" />
            </body>
        </html>
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