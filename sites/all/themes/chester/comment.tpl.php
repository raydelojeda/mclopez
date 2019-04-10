<?php global $user;?>
<div class="row-fluid comment" <?php print $attributes; ?>>
<div class="span3">  <?php print $picture ?></div>
  <div class="span9">
  <div class="title_comment">
        <span><?php print str_replace('(not verified)','',$author)  ?></span><span><?php print date('l \, j M Y H:i',$comment->created)?></span>
		<span><?php print str_replace('Permalink','Comment Link',$permalink) ?></span>
</div>		


  <div class="content"<?php print $content_attributes; ?>>
    <?php
      // We hide the comments and links now so that we can render them later.
      hide($content['links']);
      print render($content);
    ?>
    <?php if ($signature): ?>
    <div class="user-signature clearfix">
      <?php print $signature ?>
    </div>
    <?php endif; ?>
  </div>

  <?php print render($content['links']) ?>
    </div>
</div>
