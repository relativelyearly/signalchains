$(function() {
  $("select, input:checkbox, input:radio, input:file, input.create").uniform();
  $.localScroll({duration: 500});
  $('a.zoom').fancybox({
      'zoomSpeedIn':    300,
      'hideOnOverlayClick': true,
      'zoomSpeedOut': 300,
      'overlayShow': false,
      'imageScale': true
    });  
  $('.timestamp').cuteTime();
})