<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="html" encoding="UTF-8" indent="yes"/>
	<xsl:template match="page">
		<html>
			<head>
				<title><xsl:value-of select="/page/title" /></title>
<!--				<base target="_self" />-->
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
				<meta name="author" content="Hiro" />
				<meta name="copyright" content="Hiro" />
				<meta name="description" content="www.ak2games.com/hiro" />
				<meta name="keywords" content="hiro, ondrej hirjak, game, development, engine, c, c++, c#, java, asm, linux, bachelor degree, master degree" />
				<link rel="stylesheet" href="sitestyle.css" type="text/css" />
				<link rel='shortcut icon' href="data/images/page.ico" />
			</head>
			<body>
				<xsl:apply-templates select="body" />
			</body>
		</html>
	</xsl:template>
	<xsl:template match="body">
		<a name="top" />
		<table cellspacing="1" cellpadding="2" width="800px" align="center">
			<tr height="65" valign="bottom">
				<td align="center" colspan="4" class="header">
					<h1><xsl:value-of select="/page/title" /></h1>
				</td>
			</tr>
			<xsl:call-template name="menu" />
		</table>
		<table cellspacing="1" width="800px" align="center">
			<tr>
				<td>
					<xsl:for-each select="item">
						<h3><a name="{@name}"><xsl:value-of select="@name" /></a></h3>
						<xsl:apply-templates /><br/>
						<br/><a href="#top">Top</a>
					</xsl:for-each>
				</td>
			</tr>
		</table>
	</xsl:template>
	<xsl:template name="menu">
		<tr>
			<td class="font_menu">
<!--				<a href="{/page/parent}.xml">Back</a><xsl:text> </xsl:text>-->
				<xsl:for-each select="/page/body/item">
					<a href="#{@name}"><xsl:value-of select="@name" /></a><xsl:text> </xsl:text>
				</xsl:for-each>
			</td>
		</tr>
	</xsl:template>
	<xsl:template match="subitem">
		<h4><xsl:value-of select="@name" /></h4>
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match="nl">
		<br/>
	</xsl:template>
	<xsl:template match="link">
		<a href="{@res}"><xsl:apply-templates /></a>
	</xsl:template>
	<xsl:template match="image">
		<a href="{@res}.{@type}" target="_blank"><img src="{@res}-thumb.{@type}" /></a>
	</xsl:template>
	<xsl:template match="list">
		<ul>
			<xsl:for-each select="point">
				<li><xsl:apply-templates /></li>
			</xsl:for-each>
		</ul>
	</xsl:template>
</xsl:transform>
