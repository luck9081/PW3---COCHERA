var map;
var lat;
var lon;

function initialize() {

    // Para evento click del button "mapa" del default.aspx para modal.
    $('.mapita').click(function () {
        lat = $(this).data('lat');
        lon = $(this).data('lon');

        var mapOptions = {
            center: new google.maps.LatLng(lat, lon),
            zoom: 12,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        };

        map = new google.maps.Map(document.getElementById("mapa"), mapOptions);

        var marker = new google.maps.Marker({
            position: new google.maps.LatLng(lat, lon),
            map: map,
            draggable: true,
        });
    });

}

google.maps.event.addDomListener(window, 'load', initialize);

$('#myModal1').on('shown.bs.modal', function () {
    google.maps.event.trigger(map, 'resize');
});