var initialLocation;
var currentLocation;
// var latitude;
// var longitude;
var latitude = 8.228021;
var longitude = 124.2452422;
var selectedData;
var map;
$(function() {
	setMapSize();
	initialize();

// $(document).on('pagebeforehide', '[data-role="page"]', function(e, data) {
// var loader = setInterval(function() {
// $.mobile.utils.showWaitBox("a", "Loading...");
// clearInterval(loader);
// }, 1);
// });
//
// $(document).on('pageshow', '[data-role="page"]', function(e, data) {
// var loader = setInterval(function() {
// $.mobile.utils.hideWaitBox();
// clearInterval(loader);
// }, 1);
// });

	$('#result-map').live("pageshow", function() {
		$('#map_canvas').gmap('refresh');
	});
	$("#query").keypress(function(e) {
        if(e.which == 13) {
        	$("#search-btn").trigger('click');
            return false;
        }
    });
	$("#search-btn")
			.live(
					"click",
					function() {
						$.mobile.showPageLoadingMsg();
						var query = $("#query").val();
						var radius = $("#radius").val();

						map = $('#map_canvas').gmap('getMap');
						var request = {
							location : currentLocation,
							radius : radius * 1000,
							keyword : query
						};

						var service = new google.maps.places.PlacesService(map);
						service
								.nearbySearch(
										request,
										function(results, status) {

											if (status == google.maps.places.PlacesServiceStatus.OK) {
												$('#map_canvas').gmap('clearMarkers');
												$('#resultList').html('');
												for ( var i = 0; i < results.length; i++) {
													$('#resultList')
															.append(
																	'<li><a href="#details-page" class="details" id="'
																			+ results[i].reference
																			+ '"><img src="'
																			+ results[i].icon
																			+ '" class="ul-li-icon" /> <h3>&nbsp;'
																			+ results[i].name
																			+ '</h3><p><strong>&nbsp;Vicinity: '
																			+ results[i].vicinity
																			+ '</strong></p></a>');
													createMarker(results[i]);
												}
												$('#resultList').listview(
														'refresh');
											} else {
												$('#resultList')
														.html(
																"<center><h3>No Results Found!</h3></center");
											}
										});
						$.mobile.hidePageLoadingMsg();
					});

	$('.details').live('click', function() {
		var request = {
			reference : $(this).attr('id')
		};
		map = $('#map_canvas').gmap('getMap');
		service = new google.maps.places.PlacesService(map);
		service.getDetails(request, function(place, status) {
			if (status == google.maps.places.PlacesServiceStatus.OK) {
				selectedData = place;
				isFav(place);
				$("#name").html("Name: " + place.name);
				$("#address").html("Address: " + place.formatted_address);
				$("#phone").html("Phone:" + place.formatted_phone_number);				
				if (place.rating)
					$("#rating").html("Rating: " + place.rating);
				$("#item-site").attr('href', place.website);
			}
		});
	});
	
	$("#fav").live("click", function () {		
		$.mobile.showPageLoadingMsg();
		var db = window.openDatabase("Favorites", "1.0", "Favorites", 200000);
		$("#resultList").html("");
		try {
			db.transaction(function (tx) {
				tx.executeSql('SELECT * FROM Favorite', [], function (tx, results) {					
					if (results != null && results.rows != null) {
						$('#map_canvas').gmap('clearMarkers');
						for (var index = 0; index < results.rows.length; index++) {
							var entry = results.rows.item(index)
							$('#resultList')
								.append(
										'<li><a href="#details-page" class="details" id="'
										+ entry.reference
										+ '"><img src="'
										+ entry.icon
										+ '" class="ul-li-icon" /> <h3>&nbsp;'
										+ entry.name
										+ '</h3><p><strong>&nbsp;Vicinity: '
										+ entry.vicinity
										+ '</strong></p></a>');
							var request = {
									reference : entry.reference
								};
								map = $('#map_canvas').gmap('getMap');
								service = new google.maps.places.PlacesService(map);
								service.getDetails(request, function(place, status) {
									if (status == google.maps.places.PlacesServiceStatus.OK) {
										createMarker(place);
									}
								});
						}
						$('#resultList').listview('refresh');
					}else{
						$('#resultList').html("<center><h3>No Favorites Found!</h3></center");
					}
				}, function (error) {
						console.log("Got error fetching favorites " + error.code + " " + error.message);
					});
			});
		} catch (err) {
			console.log("Got error while reading favorites " + err);
		}
		$.mobile.hidePageLoadingMsg();
	});
	
	$("#addFave").live('click',function(){
		addToFavorite(selectedData);
		$(this).hide();
		$("#removeFave").show();
	});
	$("#removeFave").live('click',function(){
		removeFromFavorite(selectedData);
		$(this).hide();
		$("#addFave").show();
	});

});

function createMarker(place) {
	var placeLoc = place.geometry.location;
	$('#map_canvas').gmap('addMarker', {
		'position' : placeLoc,
		'animation' : google.maps.Animation.DROP
	}, function(map, marker) {
		$('#map_canvas').gmap('addInfoWindow', {
			'position' : marker.getPosition(),
			'content' : place.name
		}, function(iw) {
			$(marker).click(function() {
				iw.open(map, marker);
				map.panTo(marker.getPosition());
			});
		});
	});

}

function initialize() {
	// navigator.geolocation.getCurrentPosition(onSuccess,
	// onError,{enableHighAccuracy:true});
	currentLocation = new google.maps.LatLng(latitude, longitude);

	$('#map_canvas').gmap({
		'center' : currentLocation,
		'zoom' : 12,
		'scrollwheel' : true
	});
}

function onSuccess(position) {	
	initialLocation = position;
	latitude = position.coords.latitude;	
	longitude = position.coords.longitude;
}

function onError(error) {
	alert('code: ' + error.code + '\n' + 'message: ' + error.message + '\n');
}

function setMapSize() {
	var width = window.innerWidth - 100;
	var height = window.innerHeight - 200;
	$("#map_canvas").width(width);
	$("#map_canvas").height(height);
}

function ensureTableExists(tx) {
	tx
			.executeSql('CREATE TABLE IF NOT EXISTS Favorite (id unique, reference,name,address,phone,rating,icon,vicinity,url)');
}

function addToFavorite(data) {
	var db = window.openDatabase("Favorites", "1.0", "Favorites", 20000000);
	db
			.transaction(
					function(tx) {
						ensureTableExists(tx);
						var id = (data.id != null) ? ('"' + data.id + '"')
								: ('""');
						var reference = (data.reference != null) ? ('"'
								+ data.reference + '"') : ('""');
						var name = (data.name != null) ? ('"' + data.name + '"')
								: ('""');
						var address = (data.formatted_address != null) ? ('"'
								+ data.formatted_address + '"') : ('""');
						var phone = (data.formatted_phone_number != null) ? ('"'
								+ data.formatted_phone_number + '"')
								: ('""');
						var rating = (data.rating != null) ? ('"' + data.rating + '"')
								: ('""');
						var icon = (data.icon != null) ? ('"' + data.icon + '"')
								: ('""');
						var vicinity = (data.vicinity != null) ? ('"'
								+ data.vicinity + '"') : ('""');
						var url = (data.website != null) ? ('"' + data.website + '"')
								: ('""');
						var insertStmt = 'INSERT INTO Favorite (id,reference,name,address,phone,rating,icon,vicinity,url) VALUES ('
								+ id
								+ ','
								+ reference
								+ ','
								+ name
								+ ','
								+ address
								+ ','
								+ phone
								+ ','
								+ rating
								+ ','
								+ icon + ',' + vicinity + ',' + url + ')';
						tx.executeSql(insertStmt);
					}, function(error) {
						console.log("Data insert failed " + error.code + " "
								+ error.message);
					}, function() {
						console.log("Data insert successful");
					});
}

function removeFromFavorite(data) {
	try {
		var db = window.openDatabase("Favorites", "1.0", "Favorites", 20000000);
		db.transaction(function(tx) {
			ensureTableExists(tx);
			var deleteStmt = "DELETE FROM Favorite WHERE id = '" + data.id
					+ "'";
			console.log(deleteStmt);
			tx.executeSql(deleteStmt);
		}, function(error) {
			console.log("Data Delete failed " + error.code + " "
					+ error.message);
		}, function() {
			console.log("Data Delete successful");
		});
	} catch (err) {
		console.log("Caught exception while deleting favorite " + data.name);
	}
}


function isFav(data) {
	var db = window.openDatabase("Favorites", "1.0", "Favorites", 200000);
	try {
		db.transaction(function (tx) {
			ensureTableExists(tx);
			var sql = "SELECT * FROM Favorite where id='" + data.id + "'";
			tx.executeSql(sql, [], function (tx, results) {
			var result = (results != null && results.rows != null && results.rows.length > 0);
			if(result){
				$("#removeFave").show();
				$("#addFave").hide();
			}
			else{
				$("#removeFave").hide();
				$("#addFave").show();
			}
			}, function (tx, error) {		
				console.log("Got error in isFav error.code =" + error.code + "error.message = " + error.message);		
			});
		});
	} catch (err) {
		console.log("Got error in isFav " + err);
		callback(false);
	}
}