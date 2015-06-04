<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/Loja">
		<xsl:apply-templates select="Clientes/*" />
		<xsl:apply-templates select="Produtos" />
	</xsl:template>

	<xsl:template match="Clientes/*" />

	<xsl:template match="Produtos">
		<xsl:element name="Bicicletas">
			<xsl:apply-templates select="Bicicletas/Bicicleta"/>
		</xsl:element>
		<xsl:apply-templates select="*"/>
	</xsl:template>

	<xsl:template match="Bicicletas/Bicicleta">
		<xsl:if test="position()=last()">
			<xsl:element name="Bicicleta">
				<xsl:attribute name="name">
					<xsl:apply-templates select="@name"/>
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

	<xsl:template match="*" />
</xsl:stylesheet>