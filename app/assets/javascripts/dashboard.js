// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
var map;
function loadMap() {
  var miami = {lat:25.7617, lng:80.1918}
  var map = new google.maps.Map(document.getElementById('gmapDash'), {
    zoom: 2,
    center: miami
  });
  // for (var i = 0; i < gon.latlng.length; i++) {
  //   var test = {lat: gon.latlng[i][0], lng: gon.latlng[i][1]};
  //   var marker = new google.maps.Marker({
  //     position: test,
  //     map: map
  //   });
  // }
};

var datetime = null,
        date = null;

var update = function () {
    date = moment(new Date())
    datetime.html(date.format('dddd, MMMM Do YYYY, h:mm:ss a'));
};

$(document).ready(function(){
    datetime = $('#datetime')
    update();
    setInterval(update, 1000);
});
