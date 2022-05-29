var buttonLoad;
var dropDownCountry;
var buttonAddCountry;
var buttonUpdateCountry;
var buttonDeleteCountry;
var labelCountryName;
var fieldCountryName;
var fieldCountryCode;

$(document).ready(function() {
    buttonLoad = $("#buttonLoadCountries");
    dropDownCountry = $("#dropDownCountries");
    buttonAddCountry = $("#buttonAddCountry");
    buttonUpdateCountry = $("#buttonUpdateCountry");
    buttonDeleteCountry = $("#buttonDeleteCountry");
    labelCountryName = $("#labelCountryName");
    fieldCountryName = $("#fieldCountryName");
    fieldCountryCode = $("#fieldCountryCode");

    buttonLoad.on("click", function() {
        loadCountries();
    });

    dropDownCountry.on("change", function() {
        changeFromStateToSelectedCountry();
    });

    buttonAddCountry.click(function() {
        if (buttonAddCountry.val() == "Add") {
            addCountry();
        } else {
            changeFromStateToNew();
        }
    });
});

function addCountry() {
    url = contextPath + "countries/save";
    countryName = fieldCountryName.val();
    countryCode = fieldCountryCode.val();
    jsonData = { name: countryName, code: countryCode };
    $.ajax({
        type: "POST",
        url: url,
        beforeSend: function(xhr) {
            xhr.setRequestHeader(csrfHeaderName, csrfValue);
        },
        data: JSON.stringify(jsonData),
        contentType: "application/json"
    }).done(function(countryId) {
        alert("newly added country ID: " + countryId);
    })
}

function changeFromStateToNew() {
    buttonAddCountry.val("Add");
    labelCountryName.text("Country Name");

    buttonUpdateCountry.prop("disabled", false);
    buttonDeleteCountry.prop("disabled", false);

    fieldCountryCode.val("");
    fieldCountryName.val("").focus();
}

function changeFromStateToSelectedCountry() {
    buttonAddCountry.prop("value", "New");
    buttonUpdateCountry.prop("disabled", false);
    buttonDeleteCountry.prop("disabled", false);

    labelCountryName.text("Selectec Country:");

    selectedCountryName = $("#dropDownCountries option:selected").text();
    fieldCountryName.val(selectedCountryName);

    countryCode = dropDownCountry.val().split("-")[1];
    fieldCountryCode.val(countryCode);
}

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
        showToastMessage("All countries have been loaded");
    }).fail(function() {
        showToastMessage("ERROR: Could not connect to server or server encountered an error");
    })
}

function showToastMessage(message) {
    $("#toastMessage").text(message);
    $(".toast").toast('show');
}