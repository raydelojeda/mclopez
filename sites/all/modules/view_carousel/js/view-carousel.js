Drupal.behaviors.views_carousel =  {
  attach: function(context) {
    if(Drupal.settings.views_carousel){
      (function ($) {
        $.each(Drupal.settings.views_carousel, function(id) {
		   $('#'+id).owlCarousel({
           slideSpeed : this.slideSpeed,
    	   paginationSpeed : this.paginationSpeed,
           autoPlay : (this.autoPlay==0)?false:this.autoPlay,
    	   goToFirst :(this.goToFirst==1),
    	   goToFirstSpeed : this.goToFirstSpeed,
           navigation :(this.navigation==1),
    	   navigationText : this.navigationText,
    	   pagination :(this.pagination==1),
    	   paginationNumbers:(this.paginationNumbers==1),
           responsive: (this.responsive==1),
           items : this.items,
    	   itemsDesktop : this.itemsDesktop,
		   itemsDesktopSmall : this.itemsDesktopSmall,
		   itemsTablet: this.itemsTablet,
		   itemsMobile : this.itemsMobile           		   
          });
        });
      })(jQuery);
    }
  }
};