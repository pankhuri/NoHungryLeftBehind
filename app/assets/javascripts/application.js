// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require twitter/bootstrap
//= require jquery-ui
//= require jquery.backgroundSize
//= require_tree .

var handler = Gmaps.build('Google');

$(function () {

  $.get('truck_locations/last', function(data){
    currentPosition = {"latitude":data.latitude, "longitude":data.longitude, "position":data.position}
    locations = latLongs.slice(0,currentPosition.position)
    drawPolyline(locations, 'green')
  });


  $(".header-outer, .panel1, .panel2, .panel3").css({backgroundSize: "cover"});

  $('.close-spread, .open-close').click(function () {
   // Set the effect type
   var effect = 'slide';
   // Set the options for the effect type chosen
   var options = { direction: 'right' };
   // Set the duration (default: 400 milliseconds)
   var duration = 700;
   $('#toggle').toggle(effect, options, duration);
   });


  $( "#slider-range-min" ).slider({
    range: "min",
    value: 37,
    min: 1,
    max: 700,
    slide: function( event, ui ) {
      $( "#amount" ).val( ui.value );
    }
  });

  $( "#amount" ).val( "$" + $( "#slider-range-min" ).slider( "value" ) );

  $( "#datepicker" ).datepicker({
    showOn: "button",
    buttonImageOnly: false,
    buttonText: "Select date"
  });

  $( "#speed" ).selectmenu();

});

function drawPolyline(locations, color) {
  var truckRouteCoordinates = [];
  for(i =0;i<locations.length;i++)
  { 
    latitude = locations[i]["lat"] || locations[i].latitude
    longitude = locations[i]["lng"] || locations[i].longitude
    truckRouteCoordinates.push(new google.maps.LatLng(latitude, longitude));
  }


  var truck = {
    path: 'M -1,0 A 1,1 0 0 0 -3,0 1,1 0 0 0 -1,0M 1,0 A 1,1 0 0 0 3,0 1,1 0 0 0 1,0M -3,3 Q 0,5 3,3',
    strokeColor: '#00F',
    rotation: 45
  };

  var truckPath = new google.maps.Polyline({
    path: truckRouteCoordinates,
    geodesic: true,
    strokeColor: color,
    strokeOpacity: 2.0,
    strokeWeight: 4,
    travelMode: google.maps.TravelMode.BICYCLING,
    icons: [
    {
      icon: truck,
      offset: '50%'
    }
    ]

  });

  return truckPath

}

function initializeMap(locations){
  setTimeout(worker, 1000);
  truckPath = drawPolyline(locations, 'red')

  handler.buildMap({ provider: {}, internal: {id: 'feed_map'}}, function(){
    markers = handler.addMarkers(locations);
    handler.bounds.extendWith(markers);
    handler.fitMapToBounds();
    truckPath.setMap(handler.getMap());
  });
}
  var worker = function(){
    currentPosition = getNextLocationFromJson(currentPosition)
    var timeoutTime = 2000;
    if (currentPosition.pickUpLocation == true){
      timeoutTime = 20000
      updateLocation('pick_up_location', currentPosition)
    }
    else if (currentPosition.dropLocation == true){
      timeoutTime = 30000
      updateLocation('drop_location', currentPosition)
    }
    $.ajax({
      url: '/truck_locations/last',
      type: 'PUT',
      data: {'truck_location' :currentPosition},
      success: function(data) {
        console.log("Successfully updated")
      },
      complete: function() {
        setTimeout(worker, timeoutTime);
      }
    });
    locations = latLongs.slice(0,currentPosition.position)
    truckPath = drawPolyline(locations, 'green');
    truckPath.setMap(handler.getMap());

  };

  var updateLocation = function(stopType, currentPosition){
    $.ajax({
      url: stopType + '/update',
      type: 'PUT',
      data: {stopType : currentPosition},
      success: function(data){
        console.log("Successfully updated")
      }
    })
  }

  var getNextLocationFromJson = function(prevPosition){
    if (latLongs.length > prevPosition.position + 1){
      currentPosition = latLongs[prevPosition.position + 1]
      currentPosition["position"] = prevPosition.position + 1
    }
    else{
      currentPosition = latLongs[0]
      currentPosition["position"] = 0
      resetAllStops();
    }
    return currentPosition
  };

  var resetAllStops = function(){
    $.ajax({
      url: 'locations/reset',
      type: 'PUT',
      success: function(data){
        console.log("Successfully updated")
      }
    })
  };