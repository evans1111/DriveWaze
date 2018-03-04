// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require materialize-sprockets


//= require rails-ujs
//= require turbolinks
//= require_tree .


//Map for Feed page
var map, map2, map3

  function initMap() {
      for (var i = 0; i < gon.latlng.length; i++) {
       var test = {lat: gon.latlng[i][0], lng: gon.latlng[i][1]};

       var map = new google.maps.Map(document.getElementById('map' + i), {
         zoom: 15,
         center: test
       });
       var marker = new google.maps.Marker({
         position: test,
         map: map
       });
     }

};

//Map for dashboard
   function initialize() {
        var myOptions = {
          zoom: 12,
          center: new google.maps.LatLng(25.7625231,-80.194664)
        }

        map2 = new google.maps.Map(document.getElementById('mapDash'), myOptions)

        for (var i = 0; i < gon.latlng.length; i++) {
          var latlng = {lat: gon.latlng[i][0], lng: gon.latlng[i][1]}
          var park = new google.maps.Marker({
            position: latlng,
            map: map2
          })
        }
      };

//Directions Map










   // map.addListener('turbolinks:load', initMap())


// Initialize Map


//To place multiple Markers, loop through feed results. Since data is on same domain
//use Google Maps data layer ex: map.data.loadGeoJson() method


$(document).ready(function() {
   $(".button-collapse").sideNav();
   console.log("javaScript is working!");


});

// scrolling effect

jQuery(document).ready(function($) {
  $(window).scroll(function() {
    var scrollPos = $(window).scrollTop(),
        navbar = $('.nav-wrapper');

    if (scrollPos > 580) {
      navbar.addClass('alt-color');
    } else {
      navbar.removeClass('alt-color');
    }
  });
});
