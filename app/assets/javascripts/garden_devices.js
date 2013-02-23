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