# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $("#user_type").change (e) ->
    e.preventDefault()
    alert($(this).find(":selected").val())
    
