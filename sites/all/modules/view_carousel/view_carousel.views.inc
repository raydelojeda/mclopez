<?php

/**
 * @file
 * Views integration for jCarousel module.
 */

/**
 * Implements hook_views_plugin().
 */
function view_carousel_views_plugins() {
  $plugins['style']['view_carousel'] = array(
    'title' => t('Carousel'),
    'help' => t('Display rows in a carousel via Carousel.'),
    'handler' => 'view_carousel_style_plugin',
    'theme' => 'views_view_carousel',
    'uses row plugin' => TRUE,
	'uses row class' => TRUE,
    'uses options' => TRUE,
    'uses grouping' => FALSE,
    'type' => 'normal',
  );
  return $plugins;
}

