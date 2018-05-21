var fs = require('fs');
var countries;

var xsdString = `<?xml version="1.0" encoding="UTF-8" ?>
<main:document 
    xmlns:main="file://doc.xsd"
    xmlns="file://doc.xsd" 
    xmlns:meta="file://doc-meta.xsd">
    `;

fs.readFile('./src/countriesInfo.json', 'utf8', function (err, data) {
    if (err) throw err;
    countries = JSON.parse(data);
    //console.log(countries);

    var xmlString = `
    <document-info>
        <title>Countries of the World</title>
        <date>24.04.2018</date>
        <author>Joanna Dyczka</author>
        <author>Mateusz Mika</author>
    </document-info>
`;

    var xmlCountryCodes = `
    <country-codes>`;
    var xmlCountries = `
    <countries>
`;

    countries.forEach( (c,i) => {
        if (i < 1000) {
            var xmlTZones = '';
            c.timezones.forEach( t => {
                xmlTZones += `
                    <country-info-item info-item="timezone">${t}</country-info-item>`;
            });
            var xmlBor = '';
            c.borders.forEach( b => {
                xmlBor += `
                    <country-info-item info-item="border">${b}</country-info-item>`;
            });
            var xmlCurr = '';
            c.currencies.forEach( c => {
                xmlCurr += `
                    <country-info-item info-item="currency">
                        <currency-symbol>${c.symbol}</currency-symbol>
                        <currency-code>${c.code}</currency-code>
                        <currency-name>${c.name}</currency-name>
                    </country-info-item>`;
            });
            var xmlLang = '';
            c.languages.forEach( l => {
                xmlLang += `
                    <country-info-item info-item="language">${l.name}</country-info-item>`;
            });
    
            xmlCountries += `        <country country-code="${c.alpha3Code}" tabindex="0">
                <country-name>${c.name}</country-name>
                <country-flag src="${c.flag}" xmlns:html="http://www.w3.org/1999/xhtml"><html:img alt="" src="${c.flag}" /></country-flag>
                <country-info type="basic" info="region">${c.region}</country-info>
                <country-info type="basic" info="capital">${c.capital}</country-info>
                <country-info type="basic" info="population">${c.population}</country-info>
                <country-info type="basic" info="area">${c.area}</country-info>
                <country-info type="additional" info="timezones">${xmlTZones}
                </country-info>
                <country-info type="additional" info="borders">${xmlBor}</country-info>
                <country-info type="additional" info="currencies">${xmlCurr}
                </country-info>
                <country-info type="additional" info="languages">${xmlLang}
                </country-info>
                <country-info type="additional" info="calling-code">${c.callingCodes[0]}</country-info>
                <country-info type="additional" info="domain">${c.topLevelDomain}</country-info>
            </country>
    `
            xmlCountryCodes += `
            <country-code code="${c.alpha3Code}"></country-code>`

        }
    });

    xmlCountryCodes += `
    </country-codes>
    `;
    xmlCountries += `
    </countries>
`;
    
    xmlString += xmlCountryCodes + xmlCountries + `</main:document>`;


    var fs = require('fs');
    fs.writeFile('./zadanie-2/countries.xml', xsdString + xmlString, function (err) {
        if (err) {
            return console.log(err);
        }
        console.log("The file was saved!");
    });
});