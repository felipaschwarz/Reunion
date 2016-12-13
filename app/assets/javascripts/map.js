function initMap() {
  console.log("hi felipa")
  var myLatLng = {lat: 47.776818, lng: 9.277509};

  var map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: myLatLng
  });

  var locations = [
      ['Bondi Beach', -33.890542, 151.274856, 4],
      ['Coogee Beach', -33.923036, 151.259052, 5],
      ['Cronulla Beach', -34.028249, 151.157507, 3],
      ['Manly Beach', -33.80010128657071, 151.28747820854187, 2],
      ['Maroubra Beach', -33.950198, 151.259302, 1]
    ];

  var marker, infowindow, i;

  for (i = 0; i < locations.length; i++) {  
    marker = new google.maps.Marker({
      position: new google.maps.LatLng(locations[i][1], locations[i][2]),
      map: map
    });

    infowindow = new google.maps.InfoWindow({
      content: '<h1>Uluru</h1>'
    });
  }
}

function handleSuccess(destinations) {
  console.log(destinations);
};

function handleError(error) {
  console.log("Error!");
  console.log(error);
};

      function drawMap() {
        console.log('drawMap')
        var map;
        if ("geolocation" in navigator){
          navigator.geolocation.getCurrentPosition(onLocation, offLocation);
        }
      }

      function onLocation(position){
        var myPosition = {
          lat: position.coords.latitude,
          lng: position.coords.longitude
        };
        createMap(myPosition);
      }

      function offLocation(){
        var myPosition = {lat: 47.776818, lng: 9.277509};
        createMap(myPosition);
      }

      function createMap(position){
        map = new google.maps.Map($('#map')[0], {
          center: position,
          zoom: 6
      });
      }

$(document).on("turbolinks:load", function () {
  initMap();
  
  $("#marker-request").on("click", function (event) {
    event.preventDefault();
    console.log("submit works");

    $.ajax({
      url: user_map_path,
      data: destinations,
      success: handleSuccess,
      error: handleError
    });

  });
});
