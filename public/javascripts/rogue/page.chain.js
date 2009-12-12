$(function() {
  $('.show-form').click(function () {toggle_edit_link(this); return false;});
  $('#sortable_chain_gear li').hover(
    function() {
      $(this).prepend('<div class="sort_handle vulnerable"></div>');
    },
    function() {
      $('.sort_handle.vulnerable').hide();
    }
  )

  
 $('#sortable_chain_gear').sortable({
   axis:'y',
   scroll: true,
   scrollSensitivity: 60,
   placeholder: 'chain_link',
   opacity: 0.9,
   cancel: '.Preamp',
   handle: '.sort_handle',
   placeholder: 'empty_chain_gear',
   tolerance: 'pointer',
   containment: $('#sortable_chain_gear'),
   forceHelperSize: true,
   forcePlaceholderSize: true,
   cursor: 'crosshair',
   start: function() {     
     $('.sort_handle').removeClass('vulnerable').addClass('invincible');
   },
   stop: function() {
     $('.sort_handle').removeClass('invincible').addClass('vulnerable');   
   },
   update:function() { 
     $.ajax({
       data:$(this).sortable('serialize'),
       dataType:'script',
       type:'post',
       url:'/chain_gears/sort'
      })
    }
  });

    $('.chain .thumb a').fancybox({
        'zoomSpeedIn':    300,
        'zoomSpeedOut': 300,
        'overlayShow': false,
        'imageScale': true
      });


var global_lp = 0;

$("#pause").hide();

function showPauseBtn()
{
  $("#play").fadeOut(function(){
    $("#pause").fadeIn();
  });
}

function showPlayBtn()
{
  $("#pause").fadeOut(function(){
    $("#play").fadeIn();
  });
}

function playTrack(t,n)
{
  $("#jquery_jplayer").setFile(t).play();

  showPauseBtn();

  return false;
}

$("#play").click(function() {
  $("#jquery_jplayer").play();
  showPauseBtn();
  return false;
});

$("#pause").click(function() {
  $("#jquery_jplayer").pause();
  showPlayBtn();
  return false;
});

$("#stop").click(function() {
  $("#jquery_jplayer").stop();
  showPlayBtn();
  return false;
});


$("#volume-min").click( function() {
  $('#jquery_jplayer').volume(0);
  $('#sliderVolume').slider('option', 'value', 0);
  return false;
});

$("#volume-max").click( function() {
  $('#jquery_jplayer').volume(100);
  $('#sliderVolume').slider('option', 'value', 100);
  return false;
});

$("#player_progress_ctrl_bar a").live( "click", function() {
  $("#jquery_jplayer").playHead(this.id.substring(3)*(100.0/global_lp));
  return false;
});


$("#jquery_jplayer").onProgressChange( function(lp,ppr,ppa,pt,tt) {
  var lpInt = parseInt(lp);
  var ppaInt = parseInt(ppa);
  global_lp = lpInt;

  $('#loaderBar').progressbar('option', 'value', lpInt);
  $('#sliderPlayback').slider('option', 'value', ppaInt);
});


// Slider
$('#sliderPlayback').slider({
  max: 100,
  range: 'min',
  animate: true,

  slide: function(event, ui)
  {
    $("#jquery_jplayer").playHead(ui.value*(100.0/global_lp));
  }
});

$('#sliderVolume').slider({
  value : 50,
  max: 100,
  range: 'min',
  animate: true,

  slide: function(event, ui)
  {
    $("#jquery_jplayer").volume(ui.value);
  }
});

$('#loaderBar').progressbar();


//hover states on the static widgets
$('#dialog_link, ul#icons li').hover(
  function() { $(this).addClass('ui-state-hover'); },
  function() { $(this).removeClass('ui-state-hover'); }
);




});

function toggle_edit_link (element) {
  var form = $(element).parent().parent().siblings('.info').children('.notes-form');

  if(form.css('display') === 'none') {
    $(element).html('hide form');
  } else {
    $(element).html('edit notes');
  }
  form.slideToggle();

  return false;
}