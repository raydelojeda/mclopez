<?php
/**
 * @file
 * Provide an accordion style plugin for Views. This file is autoloaded by views.
 */

/**
  * Implementation of hook_views_plugin().
  */
function views_tag_format_views_plugins() {
  return array(
    'style' => array(
      'views_tag_format' => array(
        'title' => t('Views Tag Format'),
        'theme' => 'views_view_tag_format',
        'handler' => 'views_tag_format_style_plugin',
        'uses row plugin' => TRUE,
        'uses row class' => TRUE,
        'uses options' => TRUE,
        'type' => 'normal',
      ),
    ),
  );
}

