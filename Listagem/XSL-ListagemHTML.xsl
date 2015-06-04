<?xml version="1.0" encoding="ISO-8859-1"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:template match="/Loja">
		<html>
			<head>
				<link rel="stylesheet" type="text/css" href="css/listagem.css" />
				<title>LPROG Trabalho prático</title>
			</head>
			<body>
				<h1 align="center">Clientes</h1>
				<table align="center" border="1">
					<tr>
						<th/>
						<th>Nome</th>
						<th>Data de nascimento</th>
						<th>BI</th>
						<th>Email</th>
						<th>Telefone</th>
						<th>Fotografia</th>
						<th>Compras</th>
					</tr>
					<xsl:apply-templates select="Clientes/Cliente">
						<xsl:sort select="Nome"/>
					</xsl:apply-templates>
				</table>

				<h1 align="center">Produtos-Bicicletas</h1>
				<table align="center" border="1">
					<tr>
						<th/>
						<th>Marca</th>
						<th>Modelo</th>
						<th>Preco</th>
						<th>Quantidade</th>
						<th>Componentes</th>
					</tr>
					<xsl:apply-templates select="Produtos/Bicicletas/Bicicleta">
						<xsl:sort select="marca"/>
					</xsl:apply-templates>
				</table>

				<h1 align="center">Produtos-Componentes</h1>
				<table align="center" border="1">
					<tr>
						<th/>
						<th>nome</th>
						<th>tipo</th>
						<th>codigo</th>
						<th>marca</th>
						<th>caracteristicas</th>
						<th>fotografia</th>
						<th>preco</th>
						<th>quantidade</th>
					</tr>
					<xsl:apply-templates select="Produtos/Componentes/Componente">
						<xsl:sort select="nome"/>
					</xsl:apply-templates>
				</table>

				<h1 align="center">Produtos-Acessorios</h1>
				<table align="center" border="1">
					<tr>
						<th/>
						<th>nome</th>
						<th>tipo</th>
						<th>codigo</th>
						<th>preco</th>
						<th>quantidade</th>
					</tr>
					<xsl:apply-templates select="Produtos/Acessorios/Acessorio">
						<xsl:sort select="nome"/>
					</xsl:apply-templates>
				</table>
			</body>
		</html>
	</xsl:template>

	<xsl:template match="Produtos/Acessorios/Acessorio">
		<tr>
			<th>
				<xsl:value-of select="position()" />
			</th>
			<td>
				<xsl:value-of select="nome" />
			</td>
			<td>
				<xsl:value-of select="tipo" />
			</td>
			<td>
				<xsl:value-of select="codigo" />
			</td>
			<td>
				<p>Valor: <xsl:value-of select="preco/@valor" /> Tipo: <xsl:value-of select="preco/@tipo" />
				</p>
			</td>
			<td>
				<xsl:value-of select="quantidade" />
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="Produtos/Componentes/Componente">
		<tr>
			<th>
				<xsl:value-of select="position()" />
			</th>
			<td>
				<xsl:value-of select="nome" />
			</td>
			<td>
				<xsl:value-of select="tipo" />
			</td>
			<td>
				<xsl:value-of select="codigo" />
			</td>
			<td>
				<xsl:value-of select="marca" />
			</td>
			<td>
				<xsl:value-of select="caracteristicas" />
			</td>
			<td>
				<xsl:value-of select="fotografia" />
			</td>
			<td>
				<p>Valor: <xsl:value-of select="preco/@valor" /> Tipo: <xsl:value-of select="preco/@tipo" />
				</p>

			</td>
			<td>
				<xsl:value-of select="quantidade" />
			</td>
		</tr>
	</xsl:template>

	<xsl:template match="Produtos/Bicicletas/Bicicleta">
		<tr>
			<th>
				<xsl:value-of select="position()" />
			</th>
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

	<xsl:template match="Clientes/Cliente">
		<tr>
			<th>
				<xsl:value-of select="position()" />
			</th>
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
				<xsl:value-of select="Fotografia" />
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
				<th>Preço</th>
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