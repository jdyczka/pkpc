<?xml version='1.0' ?>
<xsl:stylesheet version="1.0" xmlns:main="file://doc.xsd" xmlns="file://doc.xsd" xmlns:meta="file://doc-meta.xsd" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:date="http://exslt.org/dates-and-times" 
    extension-element-prefixes="date">
	
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>

<xsl:key name="products-by-category" match="product" use="@category"/>
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
			<Summary>
				<M>
				<Country>
              <xsl:for-each select="main:document/main:countries/main:country">
				<country>
						<xsl:value-of select="main:country-name"/>
						<ld>
						<xsl:for-each select="main:country-info">
                      
						<xsl:if test="@info='population'">
						 <l><xsl:value-of select="@info='population'"/></l>
						<xsl:value-of select="(.)"/>
						</xsl:if>
						</xsl:for-each>
						</ld>
				</country>
						</xsl:for-each>
						
				</Country>
				<Pl>

				</Pl>
				</M>
			</Summary>
			<AnotherSummary>
			<NumberOfCountries>
           <xsl:value-of select="count(main:document/main:countries/main:country)"/>
			</NumberOfCountries>
			<OverallPopulation> <xsl:value-of select="sum(main:document/main:countries/main:country/main:country-info[@info='population']/.)"/></OverallPopulation>
      <value><xsl:value-of select="current-dateTime()"/></value>
			</AnotherSummary>
		</main:document>
	</xsl:template>
</xsl:stylesheet><!-- Stylus Studio meta-information - (c) 2004-2009. Progress Software Corporation. All rights reserved.

<metaInformation>
	<scenarios>
		<scenario default="yes" name="Zwykły" userelativepaths="yes" externalpreview="no" url="countries.xml" htmlbaseurl="" outputurl="" processortype="saxon8" useresolver="no" profilemode="0" profiledepth="" profilelength="" urlprofilexml=""
		          commandline="" additionalpath="" additionalclasspath="" postprocessortype="custom" postprocesscommandline="" postprocessadditionalpath="" postprocessgeneratedext='.".xslt"' validateoutput="no" validator="internal" customvalidator="">
			<advancedProp name="bSchemaAware" value="false"/>
			<advancedProp name="xsltVersion" value="2.0"/>
			<advancedProp name="schemaCache" value="||"/>
			<advancedProp name="iWhitespace" value="0"/>
			<advancedProp name="bWarnings" value="true"/>
			<advancedProp name="bXml11" value="false"/>
			<advancedProp name="bUseDTD" value="false"/>
			<advancedProp name="bXsltOneIsOkay" value="true"/>
			<advancedProp name="bTinyTree" value="true"/>
			<advancedProp name="bGenerateByteCode" value="false"/>
			<advancedProp name="bExtensions" value="true"/>
			<advancedProp name="iValidation" value="0"/>
			<advancedProp name="iErrorHandling" value="fatal"/>
			<advancedProp name="sInitialTemplate" value=""/>
			<advancedProp name="sInitialMode" value=""/>
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
				<block path="main:document/xsl:for-each/country/xsl:for-each/country-info/xsl:if/&lt;[0]" x="227" y="67"/>
				<block path="main:document/xsl:for-each/country/xsl:for-each/country-info/xsl:if/&lt;[0]/count[0]" x="181" y="61"/>
				<block path="main:document/xsl:for-each/country/xsl:for-each/country-info/xsl:if" x="273" y="69"/>
				<block path="main:document/xsl:for-each/country/xsl:for-each/country-info/xsl:for-each" x="256" y="94"/>
				<block path="main:document/Summary/M/Country/xsl:for-each" x="193" y="69"/>
				<block path="main:document/Summary/M/Country/xsl:for-each/country/ld/xsl:for-each" x="83" y="39"/>
				<block path="main:document/Summary/M/Country/xsl:for-each/country/ld/xsl:for-each/xsl:if/=[0]" x="107" y="67"/>
				<block path="main:document/Summary/M/Country/xsl:for-each/country/ld/xsl:for-each/xsl:if" x="153" y="69"/>
				<block path="main:document/AnotherSummary/NumberOfCountries/xsl:value-of" x="313" y="69"/>
			</template>
		</MapperBlockPosition>
		<TemplateContext></TemplateContext>
		<MapperFilter side="source"></MapperFilter>
	</MapperMetaTag>
</metaInformation>
-->