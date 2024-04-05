getLocation();

function getLocation() {
    if (navigator.geolocation) {
        //x = navigator.geolocation.getCurrentPosition();
        navigator.geolocation.getCurrentPosition(getCountry);
    } else {
        x.innerHTML = "Geolocation is not supported by this browser.";
    }

    //return x;
}

function getCountry(coordinates) {
    /* var xhr = new XMLHttpRequest();
    var lat = coordinates[0];
    var lng = coordinates[1];  */

    var xhr = new XMLHttpRequest();
    var lat = coordinates.coords.latitude;
    var lng = coordinates.coords.longitude;
    var token = "pk.a89474fa6d4520097636c2efa4761391";

    // Paste your LocationIQ token below.
    xhr.open('GET', "https://us1.locationiq.com/v1/reverse.php?key=" +token+ "&lat=" +
    lat + "&lon=" + lng + "&format=json", true);
    xhr.send();
    xhr.onreadystatechange = processRequest;
    xhr.addEventListener("readystatechange", processRequest, false);

    function processRequest(e) {
        if (xhr.readyState == 4 && xhr.status == 200) {
            var response = JSON.parse(xhr.responseText);
            var country = response.address.country;

            console.log(country);

            if ((country == "Barbados") || (country == "St. Vincent and the Grenadines") || (country == "Dominica")) {
                //window.location.href="./regions/index_wi.html";
            } else if ((country = "United States")) {
                //window.location.href="./regions/index_us.html";
            } else if ((country = "United Arab Emirates") || (country == "Lebanon") || (country == "Turkey")) {
                //window.location.href="./regions/index_mena.html";
            } else {
                document.getElementById("status").innerHTML = "Country not supported";
            }

            return;
        }
    }
}