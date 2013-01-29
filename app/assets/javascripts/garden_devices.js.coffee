# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

toggleFrequency = (enableBox) ->
  if enableBox.checked
    document.getElementById("device_schedule_frequency").disabled = 0
  else
    document.getElementById("device_schedule_frequency").disabled = 1
    document.getElementById("device_schedule_frequency").value = ""
sensorTypeChanged = (cBox) ->
  if cBox.value is "u"
    document.getElementById("device_schedule_is_enabled").checked = 1
    document.getElementById("device_schedule_is_enabled").disabled = 1
  else
    document.getElementById("device_schedule_is_enabled").disabled = 0

