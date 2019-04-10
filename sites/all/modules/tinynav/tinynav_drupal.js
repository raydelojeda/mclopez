Drupal.behaviors.tinynav =  {
  attach: function(context) {
    if(Drupal.settings.tinynav){
      (function ($) {
        $.each(Drupal.settings.tinynav, function(id) {
		if(this.tinynav==1)
		  $('#'+id).tinyNav({active:'selected'});
        });
      })(jQuery);
    }
  }
};