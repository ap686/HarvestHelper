function toggleFrequency(enableBox){
  if(enableBox.checked){
    document.getElementById('device_schedule_frequency').disabled = 0;
  }else{
    document.getElementById('device_schedule_frequency').disabled = 1;
    document.getElementById('device_schedule_frequency').value = '';
  }
}
  
function sensorTypeChanged(cBox){
  if(cBox.value == "u"){
    document.getElementById('device_schedule_is_enabled').checked = 1;
    document.getElementById('device_schedule_is_enabled').disabled = 1;
  }else{
    document.getElementById('device_schedule_is_enabled').disabled = 0;
  }
}

function loadMap(mapdiv, latField, longField){
  var currLatitude = latField.value;
  var currLongitude = longField.value;
  var mapOptions = {
    center: new google.maps.LatLng(currLatitude, currLongitude),
    zoom: 2,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  };
  var map = new google.maps.Map(mapdiv, mapOptions);
  var marker = new google.maps.Marker({
    draggable: true,
    position: new google.maps.LatLng(currLatitude, currLongitude),
    map: map,
    title: "Device Location"
  });
  google.maps.event.addListener(marker, 'dragend', function(event){
    latField.value = this.getPosition().lat();
    longField.value = this.getPosition().lng();
  });
}