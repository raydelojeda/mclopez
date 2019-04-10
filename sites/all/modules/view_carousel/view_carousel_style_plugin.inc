<?php

/**
 * @file
 * Contains the jCarousel style plugin.
 */

/**
 * Style plugin to render each item in an ordered or unordered list.
 *
 * @ingroup views_style_plugins
 */
class view_carousel_style_plugin extends views_plugin_style {
  function option_definition() {
    $options = parent::option_definition();
	$options['class'] = array('default' => '');
	$options['slideSpeed'] = array('default' => 200);
    $options['paginationSpeed'] = array('default' => 800);
	$options['autoPlay'] = array('default' =>0);
	$options['goToFirst'] = array('default' =>TRUE);
	$options['goToFirstSpeed'] = array('default' =>1000);
	$options['navigation'] = array('default' => FALSE);
	$options['navigationText'] = array('default' =>array('<','>'));
	$options['pagination'] = array('default' =>TRUE);
	$options['paginationNumber'] = array('default' =>FALSE);
	$options['responsive'] = array('default' =>TRUE);
	$options['items'] = array('default' =>5);
	$options['itemsDesktop'] = array('default' =>array(1199,4));
	$options['itemsDesktopSmall'] = array('default' =>array(979,3));
	$options['itemsTablet'] = array('default' =>array(768,2));
	$options['itemsMobile'] = array('default' =>array(479,1));
	return $options;
  }

  function options_form(&$form, &$form_state) {
    parent::options_form($form, $form_state);
	$form['class'] = array(
      '#title' => t('Carousel class'),
      '#description' => t('The class to provide on the list element itself.'),
      '#type' => 'textfield',
      '#default_value' => $this->options['class'],
    );
	
    $form['slideSpeed']=array(
	                          '#title'=>t('Slide Speed'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['slideSpeed'],
							  '#required'=>TRUE,
							  ); 
     $form['paginationSpeed']=array(
	                          '#title'=>t('Pagination Speed'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['paginationSpeed'],
							  '#required'=>TRUE,
							  );  							  
      $form['autoPlay']=array(
	                          '#title'=>t('Auto Play'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['autoPlay'],
							  '#required'=>TRUE,
							   ); 
     $form['goToFirst']=array(
	                          '#title'=>t('Go to first'),
	                          '#type'=>'checkbox',
							  '#default_value'=>$this->options['autoPlay'],
							   ); 	
    $form['goToFirstSpeed']=array(
	                          '#title'=>t('go to first speed'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['goToFirstSpeed'],
							  '#required'=>TRUE,
							  );  
     $form['navigation']=array(
	                          '#title'=>t('Navigation'),
	                          '#type'=>'checkbox',
							  '#default_value'=>$this->options['navigation'],
							   ); 
      $form['pagination']=array(
	                          '#title'=>t('Pagination'),
	                          '#type'=>'checkbox',
							  '#default_value'=>$this->options['pagination'],
							   ); 
       $form['paginationNumber']=array(
	                          '#title'=>t('Pagination Number'),
	                          '#type'=>'checkbox',
							  '#default_value'=>$this->options['paginationNumber'],
							   ); 							   
      $form['responsive']=array(
	                          '#title'=>t('Responsive'),
	                          '#type'=>'checkbox',
							  '#default_value'=>$this->options['responsive'],
							   ); 	
     							   
     $form['navigationText']=array('#type'=>'fieldset',
	                               '#title'=>'Navigation Text' );							   
     $form['navigationText']['nav_start']=array(
	                          '#title'=>t('Start'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['navigationText'][0],
							  ); 	
      $form['navigationText']['nav_end']=array(
	                          '#title'=>t('End'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['navigationText'][1],
							  );  							  
	 $form['items']=array(
	                          '#title'=>t('Items'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['items'],
							  '#required'=>TRUE,
							  );  
$form['advanced']= array(
      '#type' => 'fieldset',
      '#title' => t('Advanced'),
      '#collapsible' => TRUE,
      '#collapsed' => TRUE,
	  '#parents' => array('style_options'),
     );							  
 $form['advanced']['itemsDesktop']=array('#type'=>'fieldset',
	                               '#title'=>'items Desktop' );							   
 $form['advanced']['itemsDesktop'][0]=array(
	                          '#title'=>t('Start'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsDesktop'][0],
							  ); 	
 $form['advanced']['itemsDesktop'][1]=array(
	                          '#title'=>t('End'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsDesktop'][1],
							  );  	
$form['advanced']['itemsDesktopSmall']=array('#type'=>'fieldset',
	                               '#title'=>'items Desktop Small' );							   
 $form['advanced']['itemsDesktopSmall'][0]=array(
	                          '#title'=>t('Start'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsDesktopSmall'][0],
							  ); 	
 $form['advanced']['itemsDesktopSmall'][1]=array(
	                          '#title'=>t('End'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsDesktopSmall'][1],
							  );
$form['advanced']['itemsTablet']=array('#type'=>'fieldset',
	                               '#title'=>'items Tablet' );							   
 $form['advanced']['itemsTablet'][0]=array(
	                          '#title'=>t('Start'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsTablet'][0],
							  ); 	
 $form['advanced']['itemsTablet'][1]=array(
	                          '#title'=>t('End'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsTablet'][1],
							  );							  
							
$form['advanced']['itemsMobile']=array('#type'=>'fieldset',
	                               '#title'=>'items Mobile' );							   
 $form['advanced']['itemsMobile']['mobile_start']=array(
	                          '#title'=>t('Start'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsMobile'][0],
							  ); 	
 $form['advanced']['itemsMobile']['mobile_end']=array(
	                          '#title'=>t('End'),
	                          '#type'=>'textfield',
							  '#default_value'=>$this->options['itemsMobile'][1],
							  );								  
   
  }

 function pre_render($result){
    if(arg(0)!='admin')
	{
    drupal_add_js(drupal_get_path('module','view_carousel').'/js/carousel.js');
    drupal_add_js(drupal_get_path('module', 'view_carousel') .'/js/view-carousel.js');
	}
 }
function render()
{
 $output = '';
    // Prevent errors if users select content instead of fields as row style
    // This forces them to use field as row style, no other way that I can think of
    if(parent::uses_fields()){
      $output = parent::render();
    }
    else {
      drupal_set_message('Views Carousel requires Fields as row style', 'error');
    }

    // Preparing the js variables and adding the js to our display
    // we do it here so we dont have it run once every group
    $view_settings['slideSpeed'] = $this->options['slideSpeed'];
    $view_settings['paginationSpeed'] = $this->options['paginationSpeed'];
    $view_settings['autoPlay'] = $this->options['autoPlay'];
    $view_settings['goToFirst'] = $this->options['goToFirst'];
    $view_settings['goToFirstSpeed'] = $this->options['goToFirstSpeed'];
    $view_settings['navigationText'] = $this->options['navigationText'];
    $view_settings['navigation'] = $this->options['navigation'];
    $view_settings['pagination'] = $this->options['pagination'];
	$view_settings['paginationNumber'] = $this->options['paginationNumber'];
	$view_settings['responsive'] =  $this->options['responsive'];
    $view_settings['items'] =  $this->options['items'];
    $view_settings['itemsDesktop'] = $this->options['itemsDesktop'];
    $view_settings['itemsDesktopSmall'] = $this->options['itemsDesktopSmall'];
	$view_settings['itemsTablet'] = $this->options['itemsTablet'];
	$view_settings['itemsMobile'] =  $this->options['itemsMobile'];
   // $view_settings['baseClass'] =  $this->options['baseClass'];
	$carousel_id = 'carousel-'. $this->view->name;

    drupal_add_js(array('views_carousel' => array($carousel_id => $view_settings)), 'setting');

    return $output;
}
}
