<div class="<?php print $classes; ?> "<?php print $attributes; ?>>
<?php if (!$label_hidden) : ?>
<div class="field-label"<?php print $title_attributes; ?>>
<?php print $label ?>:&nbsp;</div>
<?php endif; ?>
<div class="field-items"<?php print $content_attributes; ?>>
<?php foreach ($items as $delta => $item) : ?>
<?php if(@$element['#object']->type=='blog' && $element['#field_name']=='field_image' && $delta==0) :?>
<div class="image_post row-fluid">
<?php print render($item); ?>
<ul><li><?php echo date('j \<\b\r\> M',$element['#object']->created)?></li></ul>
</div>
<h3><?php echo $element['#object']->title ?></h3>
<ul class="meta">
<li>Posted by:</li>
<li class="author"><a href="<?php echo base_path().'user/'.$element['#object']->uid ?>"><?php echo $element['#object']->name ?></a></li>
<li><a href="#"><?php echo $element['#object']->comment_count ?> comments </a></li>
</ul>
<?php else : ?>
<div class="field-item <?php print $delta % 2 ? 'odd' : 'even'; ?>"
<?php print $item_attributes[$delta]; ?>>
<?php print render($item); ?></div>
<?php endif;  ?>
<?php endforeach; ?>
</div>
</div>
