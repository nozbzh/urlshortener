// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

  $('#short-url').popover('show');

  // var range = document.createRange();
  // var selection = window.getSelection();
  // range.selectNodeContents(document.getElementById('short-url'));

  // selection.removeAllRanges();
  // selection.addRange(range);

  function SelectText(element) {
    var doc = document
        , text = doc.getElementById(element)
        , range, selection
    ;
    if (doc.body.createTextRange) {
        range = document.body.createTextRange();
        range.moveToElementText(text);
        range.select();
    } else if (window.getSelection) {
        selection = window.getSelection();
        range = document.createRange();
        range.selectNodeContents(text);
        selection.removeAllRanges();
        selection.addRange(range);
    }
  }

  SelectText('short-url');

});


