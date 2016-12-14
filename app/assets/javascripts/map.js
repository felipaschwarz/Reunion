var map;
var markers = [];

function initMap() {
  var myLatLng = {lat: 47.776818, lng: 9.277509};

  map = new google.maps.Map(document.getElementById('map'), {
    zoom: 4,
    center: myLatLng
  });
}

function addMarkers(destinations) {
  var marker,
  infowindow = new google.maps.InfoWindow();
  //infowindow = new google.maps.InfoWindow();

  for (var i = 0; i < destinations.length; i++) { 
  console.log(destinations[i]);
    marker = new google.maps.Marker({
      position: {lat: destinations[i].lng, lng: destinations[i].lat},
      map: map,
      title: destinations[i].arrival_on,
      animation: google.maps.Animation.DROP
    });
    
    google.maps.event.addListener(marker, 'click', (function(marker, i) {
      return function() {
        infowindow.setContent(destinations[i].arrival_on);
        infowindow.open(map, marker);
      }
    })(marker, i));

    markers.push(marker);

  }
}


function deleteMarkers() {
  for (var i = 0; i < markers.length; i++) {
    markers[i].setMap(null);
  }
}

function handleError(error) {
  console.log("Error!");
  console.log(error);
};


$(document).on("turbolinks:load", function () {
  initMap();
  $("#marker-request").on("click", function (event) {
    event.preventDefault();
    deleteMarkers();
    console.log("submit works");
    $.ajax({
      type: "POST",
      url: '/users/1/map',
      data:{from_date: $("#from_date").val(), to_date: $("#to_date").val()},
      success: addMarkers,
      error: handleError
    });

  });
});

      // function drawMap() {
      //   console.log('drawMap')
      //   var map;
      //   if ("geolocation" in navigator){
      //     navigator.geolocation.getCurrentPosition(onLocation, offLocation);
      //   }
      // }

      // function onLocation(position){
      //   var myPosition = {
      //     lat: position.coords.latitude,
      //     lng: position.coords.longitude
      //   };
      //   createMap(myPosition);
      // }

      // function offLocation(){
      //   var myPosition = {lat: 47.776818, lng: 9.277509};
      //   createMap(myPosition);
      // }

      // function createMap(position){
      //   map = new google.maps.Map($('#map')[0], {
      //     center: position,
      //     zoom: 6
      // });
      // }
