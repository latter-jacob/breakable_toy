$(document).ready(function(){
  path_name = window.location.pathname;
  $.ajax({
    url: path_name,
    method: 'GET',
    dataType: 'json'
  })
  .done(function(issues){
  if (path_name == "/"){

    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

      issues.forEach(function(issue) {
      markers = handler.addMarkers([
        {
          "lat": issue.latitude,
          "lng": issue.longitude,
          "infowindow": issue.headline
        }
      ]);
     });

      var selfMarker = handler.addMarker({
              lat: 42.349071,
              lng: -71.062275
            }, { opacity: 0 });

      handler.fitMapToBounds();
      handler.map.centerOn(selfMarker);
      handler.getMap().setZoom(13);

    });
  }else{
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

      var markers = handler.addMarkers([
        {
          "lat": issues.latitude,
          "lng": issues.longitude,
          "infowindow": issues.headline
        }
      ]);


          center_around = {lat: issues.latitude, lng: issues.longitude}

      handler.fitMapToBounds();
      handler.map.centerOn(center_around);
      handler.getMap().setZoom(16)
    });
    }
  })
});
