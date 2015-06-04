<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/Bicicletas">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="css/fichaproduto.css" />
			</head>
			<body>
				<h1>Ficha de produto</h1>
				<xsl:apply-templates select="Bicicleta">
					<xsl:sort select="preco" order="ascending"/>
				</xsl:apply-templates>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Bicicleta">
		<h3>Bicicleta: <xsl:value-of select="@name" /></h3> <br />
                <h3>Marca: <xsl:value-of select="marca" /> </h3> <br />
                <h3>Modelo: <xsl:value-of select="modelo" /></h3> <br />
		<h3>Agora com o preço de: <xsl:value-of select="preco" /></h3> <br />
		<h3>Em stock: <xsl:value-of select="quantidade" /> 
		</h3> <br />
		<h3>Extras</h3>
		<xsl:apply-templates select="Comps" />
	</xsl:template>

	<xsl:template match="Comps">
		<table align="center" border="1">
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