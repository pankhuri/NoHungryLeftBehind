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
//= require_tree .

$(function () {
  var latLongs = {"locations":[{"latitude":"23", "longitude":"34", "position":"2"},{"latitude":"23", "longitude":"34", "position":"2"}]}
  // var latLongs = JSON.parse(data);
  // var currentPosition = initialLatLong

  var initialLatLong = {}

  $.get('truck_locations/last', function(data){
    currentPosition = {"latitude":data.latitude, "longitude":data.longitude, "position":data.position}
    drawPolyline(initialLatLong, currentPosition)
  });

  setTimeout(worker, 5000);

  var worker = function(){
    currentPosition = getNextLocationFromJson(currentPosition)
    $.ajax({
      url: '/truck_locations/last',
      type: 'PUT',
      data: currentPosition, 
      success: function(data) {
        $('.result').html(data);
      },
      complete: function() {
        setTimeout(worker, 5000);
      }
    });
  };

  var getNextLocationFromJson = function(prevPosition){
    if (latLongs.length > prevPosition.position + 1){
      currentPosition = latLongs[prevPosition.position + 1]
      currentPosition["position"] = prevPosition.position + 1
    }
    else{
      currentPosition = latLongs[0]
      currentPosition["position"] = 0
    }
    // for (var location = 0; location < latLongs.length; location++){
    //   if (location.latitude == currentPosition["latitude"] && location.longitude == currentPosition["longitude"]){
    //     currentPosition = {"latitude" : location.latitude, "longitude":location.longitude}
    //     return false;
    //   }
    // }
  };


});