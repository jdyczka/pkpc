var fs = require('fs');
var countries;

var dtdString = `<?xml version="1.0" encoding="UTF-8" standalone="no" ?>
<!DOCTYPE document SYSTEM "doc.dtd">
<?xml-stylesheet href="style.css" type="text/css" ?>
<document>`;

var xsdString = `<?xml version="1.0" encoding="UTF-8" ?>
<document xmlns:main="countries-of-the-world/main" main:schemaLocation="./doc.xsd">`;

fs.readFile('./src/countriesInfo.json', 'utf8', function (err, data) {
    if (err) throw err;
    countries = JSON.parse(data);
    //console.log(countries);

    var xmlString = `
    <document-info>
        <title>Countries of the World</title>
        <author>Joanna Dyczka</author>
        <date>20.03.2018</date>
    </document-info>
`;

    var xmlCountryCodes = `
    <country-codes>`;
    var xmlCountries = `
    <countries>
`;

    countries.forEach( c => {
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
    });

    xmlCountryCodes += `
    </country-codes>
    `;
    xmlCountries += `
    </countries>
`;
    
    xmlString += xmlCountryCodes + xmlCountries + `</document>`;


    var fs = require('fs');
    fs.writeFile('./zadanie-1/countries.xml', dtdString + xmlString, function (err) {
        if (err) {
            return console.log(err);
        }
        console.log("The file was saved!");
    });
    fs.writeFile('./zadanie-2/countries.xml', xsdString + xmlString, function (err) {
        if (err) {
            return console.log(err);
        }
        console.log("The file was saved!");
    });
});