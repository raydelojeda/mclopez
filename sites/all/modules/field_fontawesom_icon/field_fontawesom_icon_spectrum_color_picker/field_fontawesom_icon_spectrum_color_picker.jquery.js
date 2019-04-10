/**
 * @file
 * Javascript for Color Field.
 */
(function ($) {
  Drupal.behaviors.field_fontawesom_icon_spectrum = {
    attach: function (context) {
     
	      $('.field_color_spectrum').each(function(){$('#'+this.id).spectrum({ preferredFormat: "hex",showAlpha: false,showInitial: true,showButtons:false});});
      
    }
  };
})(jQuery);
