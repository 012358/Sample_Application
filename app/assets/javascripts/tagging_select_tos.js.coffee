# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on "page:change", ->
  $(".single-taggable-field").select2(
    tags: $('.single-taggable-field').data('options')
    width: "252px"
  );