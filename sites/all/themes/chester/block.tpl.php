<?php switch($block->region) :?>
<?php  case 'main-content':?>
<?php case 'header':?> 
<?php print $content ?>
<?php break;?>
<?php  case 'nav':?>
<div class="container">
<div class="row-fluid">
<?php print $content ?>
</div>
</div>
<?php break;?>
<?php case 'sponsor':?>
<?php  case 'slider':?>
<?php print $content ?>
<?php break;?>
<?php  case 'content':?>
 <section class="section_area <?php if ($block_zebra=='even') print 'content_resalt' ?> <?php print $classes; ?>" id="<?php print $block_html_id; ?>" <?php print $attributes; ?>>
 <div class="container">
 <?php print $content ?>		
 </div> 
 </section>
<?php break;?>
<?php  case 'footer-top':?>
 <div class="span4 <?php if ($block_id%3>0) echo 'padding_items' ?> <?php print $classes; ?>" id="<?php print $block_html_id; ?>" <?php print $attributes; ?>>
 <?php print $content ?>
</div>
<?php break;?>
<?php  case 'footer-medium':?>
 <div class="span3  <?php print $classes; ?> <?php print $block->module?>" id="<?php print $block_html_id; ?>" <?php print $attributes; ?>>
 <?php if ($block->subject): ?>
<h3 <?php print $title_attributes; ?>><?php print $block->subject ?></h3>
<?php endif;?>
<?php print $content ?>
</div>
<?php break;?>
<?php  case 'footer-down':?>

<div class="span6 <?php print $classes; ?>" id="<?php print $block_html_id; ?>" <?php print $attributes; ?>>
<?php print $content ?>
</div>
<?php break;?>
<?php endswitch;?>