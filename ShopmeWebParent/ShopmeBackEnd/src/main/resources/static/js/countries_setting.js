var buttonLoad;
var dropDownCountry;

$(document).ready(function() {
    buttonLoad = $("#buttonLoadCountries");
    dropDownCountry = $("#dropDownCountries");

    buttonLoad.on("click", function() {
        loadCountries();
    });
});

function loadCountries() {
    url = contextPath + "countries/list";
    $.get(url, function(responseJSON) {
        dropDownCountry.empty();

        $.each(responseJSON, function(index, country) {
            optionValue = country.id + "-" + country.code;
            $("<option>").val(optionValue).text(country.name).appendTo(dropDownCountry);
        })
    }).done(function() {
        buttonLoad.val("Refresh Country List");
        alert("All countries have been loaded");
    })
}