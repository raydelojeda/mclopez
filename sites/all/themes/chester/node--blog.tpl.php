<div id="node-<?php print $node->nid; ?>" class=" <?php echo (arg(2)!='')?"span9":"span12" ?> <?php print $classes; ?> <?php echo arg(2) ?>" <?php print $attributes; ?>>				   
<?php print render($title_prefix); ?>
<?php if (!$page): ?>
<h2<?php print $title_attributes; ?>><a href="<?php print $node_url; ?>"><?php print
$title; ?></a></h2>
<?php endif; ?>
<?php print render($title_suffix); ?>
<div class="post-blog single " <?php print $content_attributes; ?>>
<?php
// We hide the comments and links now so that we can render them later.
hide($content['comments']);
hide($content['links']);
print render($content);
?>
</div>
<?php print str_replace(array('<h2 class="title">Comments</h2>','<h2 class="title comment-form">Add new comment</h2>'),array('<h4> Comments ('.$comment_count.')</h4>','<h4>New Comment</h4>'),render($content['comments'])); ?>
</div>
