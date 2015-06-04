<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/Loja">
        <xsl:apply-templates select="Clientes" />
        <xsl:apply-templates select="Produtos/*"/>
    </xsl:template>
    
    <xsl:template match="Produtos/*"/>
    
    <xsl:template match="Clientes">
        <xsl:for-each select="Cliente">
            <xsl:if test="DadosPessoais/Nome = 'Jorge Silva'">
                <xsl:element name="Cliente">
                    <xsl:element name="DadosPessoais">
                        <xsl:element name="Nome">
                            <xsl:value-of select="DadosPessoais/Nome" />
                        </xsl:element>
                        <xsl:element name="DataNascimento">
                            <xsl:value-of select="DadosPessoais/DataNascimento" />
                        </xsl:element>
                        <xsl:element name="BI">
                            <xsl:value-of select="DadosPessoais/BI" />
                        </xsl:element>
                        <xsl:element name="Email">
                            <xsl:value-of select="DadosPessoais/Email" />
                        </xsl:element>
                        <xsl:element name="Telefone">
                            <xsl:value-of select="DadosPessoais/Telefone" />
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="Fotografia">
                        <xsl:value-of select="Fotografia"/>
                    </xsl:element>
                    <xsl:element name="Compras">
                        <xsl:apply-templates select="Compras/Compra" />
                    </xsl:element>
                </xsl:element>
            </xsl:if>
        </xsl:for-each>
    </xsl:template>
   
    <xsl:template match="Compra">
        <xsl:element name="Compra">
            <xsl:element name="Nome">
                <xsl:value-of select="Nome"/> 
            </xsl:element>
            <xsl:element name="Quantidade">
                <xsl:value-of select="Quantidade"/>
            </xsl:element>
        </xsl:element>
    </xsl:template>
</xsl:stylesheet> 