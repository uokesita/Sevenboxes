// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function hide_alerts(){
  if ( $('.notice').html() == '' ){
    $('.notice').remove();
  } else {
    $('.notice').fadeOut(4000);
  }
  
  if ( $('.alert').html() == '' ){
    $('.alert').remove();
  } else {
    $('.alert').fadeOut(4000);
  }
}

$(document).ready(function(){
  hide_alerts();
  $("#slider").easySlider({
    auto: false,
    continuous: true
  });
})