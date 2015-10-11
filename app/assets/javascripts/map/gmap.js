$(document).ready(function(){
  $.ajax({
    url: 'issues',
    method: 'GET',
    dataType: 'json'
  })
  .done(function(issues){

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
  })
});
