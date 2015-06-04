<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
    <xsl:template match="/Loja">
        <xsl:apply-templates select="Clientes/*" />
        <xsl:apply-templates select="Produtos"/>
    </xsl:template>
    
    <xsl:template match="Produtos">
        <xsl:element name="Produtos">
            <xsl:apply-templates select="Bicicletas"/>
            <xsl:apply-templates select="Componentes"/>
            <xsl:apply-templates select="Acessorios"/>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Bicicletas">
        <xsl:element name="Bicicletas">
            <xsl:for-each select="Bicicleta">
                <xsl:if test="quantidade>4">
                    <xsl:element name="Bicicleta">
                        <xsl:attribute name="name">
                            <xsl:value-of select="@name"/>
                        </xsl:attribute>
                        <xsl:element name="marca">
                            <xsl:value-of select="marca"/>
                        </xsl:element>
                        <xsl:element name="modelo">
                            <xsl:value-of select="modelo" />
                        </xsl:element>
                        <xsl:element name="preco">
                            <xsl:value-of select="preco" />
                        </xsl:element>
                        <xsl:element name="quantidade">
                            <xsl:value-of select="quantidade"/>
                        </xsl:element>
                        <xsl:element name="Comps">
                            <xsl:apply-templates select="Comps/Comp"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Comps/Comp">
        <xsl:element name="Comp">
            <xsl:attribute name="nome">
                <xsl:apply-templates select="@nome"/>
            </xsl:attribute>
            <xsl:attribute name="preco">
                <xsl:apply-templates select="@preco"/>
            </xsl:attribute>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Componentes">
        <xsl:element name="Componentes">
            <xsl:for-each select="Componente">
                <xsl:if test="quantidade>4">
                    <xsl:element  name="Componente">
                        <xsl:element name="nome">
                            <xsl:value-of select="nome"/>
                        </xsl:element>
                        <xsl:element name="tipo">
                            <xsl:value-of select="tipo"/>
                        </xsl:element>
                        <xsl:element name="codigo">
                            <xsl:value-of select="codigo"/>
                        </xsl:element>
                        <xsl:element name="marca">
                            <xsl:value-of select="marca"/>
                        </xsl:element>
                        <xsl:element name="caracteristicas">
                            <xsl:value-of select="caracteristicas"/>
                        </xsl:element>
                        <xsl:element name="fotografia">
                            <xsl:value-of select="fotografia"/>
                        </xsl:element>
                        <xsl:element name="preco">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="preco/@valor"/>
                            </xsl:attribute>
                            <xsl:attribute name="tipo">
                                <xsl:value-of select="preco/@tipo"/>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="quantidade">
                            <xsl:value-of select="quantidade"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Acessorios">
        <xsl:element name="Acessorios">
            <xsl:for-each select="Acessorio">
                <xsl:if test="quantidade>4">
                    <xsl:element  name="Acessorio">
                        <xsl:element name="nome">
                            <xsl:value-of select="nome"/>
                        </xsl:element>
                        <xsl:element name="tipo">
                            <xsl:value-of select="tipo"/>
                        </xsl:element>
                        <xsl:element name="codigo">
                            <xsl:value-of select="codigo"/>
                        </xsl:element>
                        <xsl:element name="preco">
                            <xsl:attribute name="valor">
                                <xsl:value-of select="preco/@valor"/>
                            </xsl:attribute>
                            <xsl:attribute name="tipo">
                                <xsl:value-of select="preco/@tipo"/>
                            </xsl:attribute>
                        </xsl:element>
                        <xsl:element name="quantidade">
                            <xsl:value-of select="quantidade"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:if>
            </xsl:for-each>
        </xsl:element>
    </xsl:template>
    
    <xsl:template match="Clientes/*" />
</xsl:stylesheet> 