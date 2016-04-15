// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $('#short-url').popover('show');

  var range = document.createRange();
  var selection = window.getSelection();
  range.selectNodeContents(document.getElementById('short-url'));

  selection.removeAllRanges();
  selection.addRange(range);
});


