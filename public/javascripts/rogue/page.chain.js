$(function() {
  $('.show-form').click(function () {toggle_edit_link(this); return false;});
});

function toggle_edit_link (element) {
  var form = $(element).siblings('.notes-form');

  if(form.css('display') === 'none') {
    $(element).html('hide form');
  } else {
    $(element).html('edit notes');
  }
  form.toggle();

  return false;
}