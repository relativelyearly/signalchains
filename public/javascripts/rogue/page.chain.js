$(function() {
  $('.show-form').click(function () {toggle_edit_link(this); return false;});
  
  $(document).ready(function() {
    $('.chain .thumb a').fancybox({
        'zoomSpeedIn':    300,
        'zoomSpeedOut': 300,
        'overlayShow': false,
        'imageScale': true
      });
});
});

function toggle_edit_link (element) {
  var form = $(element).siblings('.notes-form');

  if(form.css('display') === 'none') {
    $(element).html('hide form');
  } else {
    $(element).html('edit notes');
  }
  form.slideToggle();

  return false;
}