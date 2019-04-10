<?php
class view_handler_spider_calendar_area extends views_handler_area{
function option_definition(){
$options=parent::option_definition();
$options['calendar_id']=array('default'=>NULL);
$options['wrap_class']=array('default'=>'');
return $options;
}
function options_form(&$form, &$form_state)
{
 parent::options_form($form, $form_state);
 
 $calendars=db_query("SELECT id,title FROM {spider_calendar_calendar_table} WHERE published=:published ", array(':published' => 1));
 $calendar_options=array();
 foreach($calendars as $calendar)
 $calendar_options[$calendar->id]=$calendar->title;
 $form['calendar_id']=array('#title'=>t('Spider Calendar'),
                     '#type'=>'select',
					 '#options'=>$calendar_options,
					 '#default_value'=>$this->options['calendar_id'],
					 );	
$form['wrap_class']=array('#title'=>t('wrap class'),
                          '#type'=>'textfield',
						  '#default_value'=>$this->options['wrap_class'],
						  );					 
}
function render($empty = FALSE) {
   
    if (!$empty || !empty($this->options['empty'])) {
	require_once drupal_get_path('module','spider_calendar')."/includes/spider_calendar_block_view.inc";
	$output=spider_calendar_block_show($this->options['calendar_id'], 12, 1);
	if($this->options['wrap_class']!='')
	$output=t('<div class="@class">'.$output.'</div>',array('@class'=>$this->options['wrap_class']));
     return $output;
    }
    return '';
  }
} 
