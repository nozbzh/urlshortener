// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(".urls.edit").ready(function() {

  $('#short-url').popover('show');

  $('body').click(function(){
    $('#short-url').popover('hide')
  });
  var range = document.createRange();
  var selection = window.getSelection();
  range.selectNodeContents(document.getElementById('short-url'));

  selection.removeAllRanges();
  selection.addRange(range);

});


