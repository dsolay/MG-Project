function setProperty(selector, prop, enable) {
    $(selector).prop(prop, enable);
}

function ArraytoJson(array) {
    var arrayJson = [];
    array.forEach(function (element) {
        arrayJson.push(JSON.parse(JSON.stringify(element)));
    });
    return arrayJson;
}