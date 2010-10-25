// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


function hide_alerts(){
  if ( jQuery('.notice').html() == '' ){
    jQuery('.notice').remove();
  } else {
		jQuery('.notice').css({ 'display':'block' });
    jQuery('.notice').fadeOut(4000);
  }
  
  if ( jQuery('.alert').html() == '' ){
    jQuery('.alert').remove();
  } else {
		jQuery('.alert').css({ 'display':'block' });
    jQuery('.alert').fadeOut(4000);
  }
}

function slider() {
  jQuery("#slider").easySlider({
    auto: false,
    continuous: true
  });	
}

function myActions() {
	jQuery('#myactions').click( function(){
		jQuery('#actions').slideToggle('slow');
	});
}

jQuery(document).ready(function(){
  hide_alerts();
  slider();
	myActions();
});