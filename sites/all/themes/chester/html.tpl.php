<!DOCTYPE html>
<html lang="en">
<head >
<meta charset="utf-8">
<title><?php print $head_title; ?></title>
 <meta name="viewport" content="width=device-width, initial-scale=1.0">
 <meta name="description" content="">
 <meta name="author" content="">
 
<?php print $styles; ?>
<?php if(isset($skin)):?>
 <link href="<?php print $skin ?>" rel="stylesheet" media="screen" class="skin">
 <?php endif;?>
 <link rel="shortcut icon" href="<?php echo drupal_get_path('theme','chester') ?>img/icons/favicon.ico">
    <link rel="apple-touch-icon" href="<?php echo drupal_get_path('theme','chester') ?>/img/icons/apple-touch-icon.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo drupal_get_path('theme','chester') ?>/img/icons/apple-touch-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo drupal_get_path('theme','chester') ?>/simg/icons/apple-touch-icon-114x114.png">    
<?php print $scripts; ?>
</head>
<body class="<?php print $classes; ?>" <?php print $attributes;?>>
<?php print $page_top; ?>
<?php print $page; ?>
<?php print $page_bottom; ?>
</body>
</html>