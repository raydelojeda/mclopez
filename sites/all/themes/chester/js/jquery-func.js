
/*	Name: jquery-funcs.js
	Version: 1.2
*/
var $base_url=location.host;
if(location.port!='')
$base_url=base_url+':'+location.port;
function site_url(x){
return $base_url+'/'+x;
}

jQuery(document).ready(function(){	

	'use strict';

 	
	//=================================== Totop  ===================================//
	jQuery().UItoTop({ 		
		scrollSpeed:500,
		easingType:'linear'
	});	
	//=================================== Tooltips =====================================//
	if( jQuery.fn.tooltip() ) {
		jQuery('[class="tooltip_hover"]').tooltip();
	}
	//=========================================== Set ckeditor to text plain======================================//
	
	jQuery('.form-comment a.ckeditor_links').trigger('click');
	
	//========================================================  color changer =====================================//
	
	jQuery('#theme-options ul.backgrounds li').click(function(){
		var $bgSrc = jQuery(this).css('background-image');
		if (jQuery(this).attr('class') == 'bgnone')
			$bgSrc = "none";

		jQuery('body').css('background-image',$bgSrc);
		jQuery.cookie('background', $bgSrc);
		jQuery.cookie('backgroundclass', jQuery(this).attr('class').replace(' active',''));
		jQuery(this).addClass('active').siblings().removeClass('active');
	});


	jQuery('#theme-options .title').click(function(){
	 var $left;
		if (jQuery('#theme-options').css('left') == "-182px")
		{
			 $left = "0px";
			jQuery.cookie('displayoptions', "0");
		} else {
			$left = "-182px";
			jQuery.cookie('displayoptions', "1");
		}

		jQuery('#theme-options').animate({left: $left},{duration: 500});

	});

	jQuery(function(){
		jQuery('#theme-options').fadeIn();
	   var $bgSrc = jQuery.cookie('background');
		jQuery('body').css('background-image',$bgSrc);

		if (jQuery.cookie('displayoptions') == "1")
		{
			jQuery('#theme-options').css('left','-182px');
		} else if (jQuery.cookie('displayoptions') == "0") {
			jQuery('#theme-options').css('left','0');
		} else {
			jQuery('#theme-options').delay(800).animate({left: "-182px"},{duration: 500});
			jQuery.cookie('displayoptions', "1");
		}
		jQuery('#theme-options ul.backgrounds').find('li.' + jQuery.cookie('backgroundclass')).addClass('active');

	});
	
   jQuery(".colorbox").click(function(){
	    var $skin=jQuery(this).data('skin');
		jQuery(".skin").attr("href", site_url('sites/all/themes/chester/css/skins/'+$skin+'/'+$skin+'.css'));
		jQuery.post('admin/skin',{color:jQuery(this).data('color')});
        return false;
    });
    
  

	

        
});

//================================== Slide portfolio =============================//

	/*jQuery('#slide_portfolio').camera({
		 height: '57%'
	});*/
	
