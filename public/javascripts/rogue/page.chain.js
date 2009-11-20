$(function() {
  $('.show-form').click(function () {toggle_edit_link(this); return false;});
});

function toggle_edit_link (element) {
  var form = $(element).siblings('.notes-form');

  if(form.css('display') === 'none') {
    form.show();
    $(element).html('hide form');
  } else {
    form.hide();
    $(element).html('edit notes');
  }

  return false;
}