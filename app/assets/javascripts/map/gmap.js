$(document).ready(function(){
  path_name = window.location.pathname;
  $.ajaxSetup({cache: false});
  $.ajax({
    url: path_name,
    method: 'GET',
    dataType: 'json'
  })
  .done(function(not_completed_issues){
  if (path_name == "/"){

    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){

      not_completed_issues.forEach(function(issue) {
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
          "lat": not_completed_issues.latitude,
          "lng": not_completed_issues.longitude,
          "infowindow": not_completed_issues.headline
        }
      ]);


          centerAround = {lat: not_completed_issues.latitude,
             lng: not_completed_issues.longitude}

      handler.fitMapToBounds();
      handler.map.centerOn(centerAround);
      handler.getMap().setZoom(16)
    });
    }
  })
});
