function handleSuccess(response) {
	console.log(response);
};

function handleError(error) {
	console.log("Error!");
	console.log(error);
};

function setupAutocompleteHome(){
  $('#user_home').on('keydown', function(event) {
    if (event.keyCode === 13) {
      event.preventDefault()
      event.stopPropagation()
    }
  })

  var input = $('.js-search-home')[0];
  var autocomplete = new google.maps.places.Autocomplete(input);
  autocomplete.addListener('home_changed',function(){

  var place = autocomplete.getPlace();
  var lat = place.geometry.location.lng();
  var lng = place.geometry.location.lat();

  $('#user_lat').val(lat);
  $('#user_lng').val(lng);
  })
}

$(document).on("turbolinks:load", function () {
	setupAutocompleteHome();
});