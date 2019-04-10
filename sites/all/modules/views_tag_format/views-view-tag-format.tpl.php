<?php
/**
 * @file
 * Displays the items of the accordion.
 *
 * @ingroup views_templates
 *
 * Note that the accordion NEEDS <?php print $row ?> to be wrapped by an
 * element, or it will hide all fields on all rows under the first field.
 *
 * Also, if you use field grouping and use the headers of the groups as the
 * accordion headers, these NEED to be inside h3 tags exactly as below
 * (though you can add classes).
 *
 * The current div wraping each row gets two css classes, which should be
 * enough for most cases:
 *     "views-accordion-item"
 *      and a unique per row class like item-0
 *
 */
 ?>
<?php if (!empty($title)): ?>
<div class="<?php print $title_class ?>">
  <?php print $title; ?>
<?php endif; ?>
<?php $count=0;?>
<?php foreach ($rows as $id => $row): ?>
<?php if($row_count>0 && $count%$row_count==0 ) : ?><div class="<?php print $group_class?>"><?php endif;  ?>
<?php if ($tag) print '<'.$tag.' class="'. $classes_array[$id].'" >'; ?>
    <?php print $row; ?>
<?php if ($tag) print '</'.$tag.'>' ?>
<?php if ($count%$row_count==$row_count-1  OR $count==count($rows)): ?></div><?php endif;  ?>
<?php $count++;?>
<?php endforeach; ?>
<?php if (!empty($title)): ?></div><?php endif; ?>

