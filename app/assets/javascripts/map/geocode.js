$('.submit').on("click", function(event) {
  event.preventDefault();
  headline = $('#issue_headline').val()
  description = $('#issue_description').val()

  geoFindMe(headline, description)
});


function geoFindMe(headline, description) {
  var output = document.getElementById("out");

  if (!navigator.geolocation){
    output.innerHTML = "<p>Geolocation is not supported by your browser</p>";
    return;
  }
  function success(position) {
    var latitude  = position.coords.latitude;
    var longitude = position.coords.longitude;

    $.ajax({
      method: "POST",
      url: ("/issues"),
      data: { "issue": {headline: headline, description: description, latitude: latitude,
         longitude: longitude } },
      dataType: "json"
    })
    .done(function(){
      window.location.href = "/";


    })
    // get the id of the next thing we want, to go to!
  };

  function error() {
    output.innerHTML = "Unable to retrieve your location";
  };

  output.innerHTML = "<p>Locating…</p>";

  navigator.geolocation.getCurrentPosition(success, error);
}
