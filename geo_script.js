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
            var state = response.address.state;

            console.log(state, country);

            switch (country) {
                case "Barbados":
                        window.location.href="./regions/caribbean/Barbados/index_bb.html";
                    break;

                case "Dominica":
                        window.location.href="./regions/caribbean/Dominica/index_dm.html";
                    break;
            
                case "St. Vincent and the Grenadines":
                        window.location.href="./regions/caribbean/SVG/index_vc.html";
                    break;

                case ("United States"):
                    if (state = "Florida")
                        window.location.href="./regions/us/Florida/index_fl.html";
                    break;

                case "United Arab Emirates":
                    if (state = "Dubai")
                        window.location.href="./regions/mena/Dubai/index_ae.html";
                    break;

                case "Lebanon":
                    window.location.href="./regions/mena/Lebanon/index_lb.html";
                    break;

                default:
                    document.getElementById("status").innerHTML = "Sorry, your location is not supported";
                    break;
            }

            // if ((country == "Barbados") || (country == "St. Vincent and the Grenadines") || (country == "Dominica")) {
            //     //window.location.href="./regions/index_wi.html";
            // } else if ((country = "United States")) {
            //     //window.location.href="./regions/index_us.html";
            // } else if ((country = "United Arab Emirates") || (country == "Lebanon") || (country == "Turkey")) {
            //     //window.location.href="./regions/index_mena.html";
            // } else {
            //     document.getElementById("status").innerHTML = "Country not supported";
            // }

            return;
        }
    }
}