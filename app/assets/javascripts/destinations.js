function handleSuccess(response) {
	console.log(response);
};

function handleError(error) {
	console.log("Error!");
	console.log(error);
};

function setupAutocompletePlace(){
  $('#destination_place').on('keydown', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault()
      event.stopPropagation()
    }
  })

  var input = $('.js-search-place')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('place_changed',function(){

  var place = autocomplete.getPlace();
  var lat = place.geometry.location.lng();
  var lng = place.geometry.location.lat();

  $('#destination_lat').val(lat);
  $('#destination_lng').val(lng);
  })
}

$(document).on("turbolinks:load", function () {
	setupAutocompletePlace();
});