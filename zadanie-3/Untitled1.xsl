<?xml version='1.0' ?>
<xsl:stylesheet version="1.0" xmlns:main="file://doc.xsd" xmlns="file://doc.xsd" xmlns:meta="file://doc-meta.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<main:document>
			<xsl:for-each select="main:document/main:countries/main:country">
				<country>
					<country-Name>
						<xsl:value-of select="main:country-name"/>
					</country-Name>
					<xsl:for-each select="main:country-info">
						<country-info>
							<xsl:attribute name="info">
								<xsl:value-of select="@info"/>
							</xsl:attribute>
							
							<xsl:if test="count(*) &lt; 1 ">
							<value><xsl:value-of select="."/></value>
							</xsl:if>
							
							<xsl:for-each select="main:country-info-item[text() != '']">
								<country-info-item>
									<xsl:attribute name="info-item">
										<xsl:value-of select="@info-item"/>
									</xsl:attribute>
					    			<xsl:value-of select="."/>
								</country-info-item>
								</xsl:for-each>
								
						</country-info>
					</xsl:for-each>
				</country>
			</xsl:for-each>
		</main:document>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Zwykły" userelativepaths="yes" externalpreview="no" url="countries.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="custom" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext='.".xslt"' validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="sInitialMode" value=""/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="iErrorHandling" value="fatal"/>
		</scenario>
	</scenarios>
	<MapperMetaTag>
		<MapperInfo srcSchemaPathIsRelative="yes" srcSchemaInterpretAsXML="no" destSchemaPath="" destSchemaRoot="" destSchemaPathIsRelative="yes" destSchemaInterpretAsXML="no">
			<SourceSchema srcSchemaPath="countries.xml" srcSchemaRoot="main:document" AssociatedInstance="" loaderFunction="document" loaderFunctionUsesURI="no"/>
		</MapperInfo>
		<MapperBlockPosition>
			<template match="/">
				<block path="main:document/xsl:for-each" x="198" y="14"/>
				<block path="main:document/xsl:for-each/country/xsl:for-each" x="180" y="57"/>
				<block path="main:document/xsl:for-each/country/xsl:for-each/country-info/xsl:for-each" x="256" y="94"/>
				<block path="main:document/xsl:for-each/country/xsl:for-each/country-info/xsl:for-each/country-info-item/value/xsl:value-of" x="273" y="69"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->