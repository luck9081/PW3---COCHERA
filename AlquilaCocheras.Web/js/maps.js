function initialize() {
            var input = document.getElementById('txtUbicacion');

            var autocomplete = new google.maps.places.Autocomplete(input);

            google.maps.event.addListener(autocomplete, 'place_changed', function () {

                var place = autocomplete.getPlace();

                document.getElementById('city2').value = place.name;
                document.getElementById('txtLatitud').value = place.geometry.location.lat();
                document.getElementById('txtLongitud').value = place.geometry.location.lng();
                //alert("This function is working!");
                //alert(place.name);
                // alert(place.address_components[0].long_name);

                var lat = document.getElementById('cityLat').value,
                    lng = document.getElementById('cityLng').value;

                var mapOptions = {
                    center: new google.maps.LatLng(lat, lng),
                    zoom: 12,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("mapa"), mapOptions);

                var marker = new google.maps.Marker({
                    position: new google.maps.LatLng(lat, lng),
                    map: map,
                    draggable: true,
                });

            });

        }

        google.maps.event.addDomListener(window, 'load', initialize);
