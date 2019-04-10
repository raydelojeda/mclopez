(function ($) {
Drupal.behaviors.icon = {
attach: function(context) {
$('.field-fontawesom-icon').each(function(){
var icon_selected=$(this).val();
if(icon_selected=='')
$('#'+this.id+'-selected').html('X');
else
{
$('#'+this.id+'-selected').html('');
$('<i>').addClass('icon-'+icon_selected).appendTo('#'+this.id+'-selected');
$('#'+icon_selected).addClass('selected');
}
});
$('.list-icon').css('display','none');
$('.field-type-fontawesom-icon').click(function(){
$('#'+this.id+' .list-icon').hide();

});
$(".list-icon >div").click(function(){
$(".list-icon > div").removeClass('selected');
$(this).addClass('selected');
var text_field_id=$(this).parent().data('field');
$('#'+text_field_id).val(this.id);
$('#'+text_field_id+'-selected').html('');
$('<i>').addClass('icon-'+this.id).appendTo('#'+text_field_id+'-selected');
$(this).parent().hide();
});
$(".field-fontawesom").live("click", function() {
$('#'+this.id+' + .list-icon').show();
});

}
}
})(jQuery);
