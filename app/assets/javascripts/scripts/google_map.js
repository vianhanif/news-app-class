function initMap() {
  var geo = new google.maps.Geocoder;
  geo.geocode({'address': document.getElementById('map-location').innerHTML},function(results, status){
        if (status == google.maps.GeocoderStatus.OK) {
          var location =  results[0].geometry.location;
          var myLatLng = {lat: location.lat(), lng: location.lng()};

          // Create a map object and specify the DOM element for display.
          var map = new google.maps.Map(document.getElementById('map'), {
            center: myLatLng,
            scrollwheel: false,
            zoom: 15
          });

          // Create a marker and set its position.
          var marker = new google.maps.Marker({
            map: map,
            position: myLatLng,
            title: 'Hello World!'
          });
        } else {
          alert("Geocode was not successful for the following reason: " + status);
        }
  });
}
