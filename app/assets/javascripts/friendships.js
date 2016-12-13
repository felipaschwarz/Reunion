function searchError(error) {
	alert("Unable to search User");
	console.log(error);
};

function getUsers() {
  console.log('hi')
}


$(document).on("turbolinks:load", function () {

	$('.js-search-form').on('click', function (event) {
		event.preventDefault();	
		var searchName = $('.js-search-name');
		console.log(searchName.val());
		
		$.ajax({
			type: "POST",
			url: '/users/search_user',
			data: searchName,
			success: searchOk,
			error: searchError
		});
		
	});
});

function searchOk(data) {
	//console.log("bla bla Felipa doesn pax attention", data);
//gibt nicht den link aber den link als text
	if (data.user_result && data.friendship_result == null ) {
    $('#searchResult').append(
    	'<li>' + data.user_result.username + '</li>'
    	//+ '<a href="/users/:user_id/friendships">Add</a>'
    	//<%= link_to "Add", user_friendships_path(friend_id: u.id), method: :post %>
    );
//gibt nicht den link aber den link als text
	} else if (data.user_result && data.friendship_result.status == 'requested') {
		$('#searchResult').append(
    	'<li>' + data.user_result.username + '</li>'
    	//+ '<%= link_to "Acctept", user_friendship_path(current_user, data.user_result), method: :put%>'
    	//+ '<%= link_to "Decline", user_friendship_path(current_user, data.user_result), method: :delete%>'
    );
//nicht probiert
  } else if (data.user_result && data.friendship_result.status == 'accepted') {
		$('#searchResult').append(
	  	'<li>' + data.user_result.username + '</li>'
	  	//+ '<%= link_to "Delete", user_friendship_path(current_user.id, data.user_result), method: :delete %>'
	  );
//funktioniert
	} else if (data.user_result && data.friendship_result.status == 'pending') {
		$('#searchResult').append(
	  	'<li>' + data.user_result.username + '</li>'
  	);
	}
// zu oft ausgeführt
	// } else {
	//   $('#searchResult').append('User not found');
	// }
}