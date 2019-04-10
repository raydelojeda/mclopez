<header>
<script type="text/javascript" src="sites/all/themes/chester/js/alertify.js/lib/alertify.js"></script>
<link rel="stylesheet" href="sites/all/themes/chester/js/alertify.js/themes/alertify.core.css" />
<link rel="stylesheet" href="sites/all/themes/chester/js/alertify.js/themes/alertify.default.css" />
<div class="head">
<div class="container">
<div class="row-fluid">
<div class="span6 logo">
<a href="<?php print $front_page  ?>" title="Regresar al Inicio">
<?php if ($logo): ?>
<img src="<?php print $logo; ?>" alt="<?php print t('Home'); ?>" />
<?php else : ?>
<h1><?php //echo ($site_name)?$site_name:"Chester" ?></h1>
<?php endif;  ?>
 </a>
</div>
<div class="span6 display_none">                            
                            <ul class="contact_top">
                                <li>
                                    <span class="color"><i class="icon-envelope"></i></span>
                                    <h5><a href="mailto:<?php echo theme_get_setting('email') ?>"><?php echo theme_get_setting('email') ?></a></h5>
                                </li>
                                <li>
                                    <span class="color"><i class="icon-phone"></i></span>
                                    <h5><?php echo theme_get_setting('phone') ?></h5>
                                </li>
                            </ul>
                        </div>
</div>
</div>
</div>
<?php if ($page['nav']): ?>
<nav>
<?php print render($page['nav']);?>
</nav>
<?php endif;  ?>
<?php if ($page['slider']):?>
<?php  print render($page['slider']);?>
<?php  if ($page['sponsor']) : ?>
<div class="sponsors display_none">
 <div class="container"> 
 <?php print render($page['sponsor']); ?>
 </div>
 </div>
<?php endif;  ?> 
<?php  elseif ($page['header']):?> 
<?php print render($page['header']);?>
<?php else : ?>
<div class="section_title">
                <div class="info_title">
                    <div class="container">
                        <div class="row-fluid">
                            <div class="span4 border_title">
                                <h1><?php echo ($title)?$title:'Untitled page' ?></h1>
                            </div>
                            <div class="span8">
                                <p>Sollemnes wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip consequat.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="span4 offset8">
                        <img src="<?php echo base_path().drupal_get_path('theme','chester') ?>/img/section_title/1.png" alt="Image">
                    </div>
                </div>
            </div>
<?php endif;  ?>			
</div>
</div>
</header>
<?php print render($page['help']); ?>
<?php if ($action_links): ?><ul class="action-links"><?php print
render($action_links); ?></ul><?php endif; ?>
<?php print render($page['content']); ?>
<section class="section_area">
<div class="container">
<div class="row-fluid">
<?php print render($page['main-content']);?>
</div>
</div>
</section>
<?php if ($page['footer-top']):?>
<footer class="section_area footer_top">
<div class="container">
<div class="row-fluid">
<?php print render($page['footer-top']);?>
</div>
</div>
</footer>
<?php endif;  ?>
<?php if ($page['footer-medium']):?>
<footer class="section_area footer_medium">
<div class="container">
<div class="row-fluid">
<?php print render($page['footer-medium']);?>
</div>
</div>
</footer>
<?php endif;  ?>
<footer class="section_area footer_down"> 
<div class="container">
                <div class="row-fluid">
                   <div class="span6" style="font-color:#000;">
                        <p><font color='#000' size="1">Ortop&eacute;dicos MCL&oacute;pez para una mejor calidad de vida | Dise&ntilde;o: Raydel Ojeda | 2016</font></p>             
                    </div>
                   <?php if ($page['footer-down']) print render($page['footer-down']); ?> 
                </div>
            </div>
</footer>




<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/573ccd57207b820b7d98fb27/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();				
</script>
<!--End of Tawk.to Script-->


<script type="text/javascript"> 
/*
(function ($) { 

alertify.alert("<p style='font-size: 20px;'><b>Ud. es acreedor de un cup&oacute;n promocional para un descuento del 10% en su compra.</b><br><br>Imprima la pantalla para mostrar su c&oacute;digo al realizar la compra.</p><br><b>C&oacute;digo: <h3>MCL"+Math.round(Math.random()*1000000)+"</h3></b>", function () {
		});
			
//window.open('variables.php','','width=700,height=400,noresize');
})(jQuery);
*/
</script>
<script type="text/javascript"> 
/*
<script type="text/javascript"> 

(function ($) { 
var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
var f=new Date();

cupon="<center><p style='font-size: 20px;'><b>Ud. es acreedor de un cup&oacute;n promocional para un descuento del 10% en su compra.</b><br><br>Imprima la pantalla para mostrar su c&oacute;digo al realizar la compra.</p><br><b>C&oacute;digo: <h3>MCL"+Math.round(Math.random()*1000000)+"</h3></b><br><hr><br>";

cupon=cupon+"<b>V&aacute;lido hasta: </b>"+f.getDate() + " de " + meses[f.getMonth()+1] + " de " + f.getFullYear()+"<br><br>";

cupon=cupon+"<button onclick='window.print()'>Imprmir</button>";

myWindow = window.open("", "myWindow", "width=600,height=500");
myWindow.document.write(cupon+"</center>");

})(jQuery);

</script>*/

</script>



