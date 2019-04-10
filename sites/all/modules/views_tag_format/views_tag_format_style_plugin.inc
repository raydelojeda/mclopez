<?php
/**
 * @file
 * Provide an accordion style plugin for Views. This file is autoloaded by views.
 */

/**
  * Implementation of views_plugin_style().
  */
class views_tag_format_style_plugin extends views_plugin_style {
  /**
   * Set default options
   */
 function option_definition() {
    $options = parent::option_definition();
    $options['tag'] = array('default' => 0);
    $options['row_count'] = array('default' => 0);
    $options['group_class'] = array('default' => '');
	return $options;
  }
  function options_form(&$form, &$form_state) {
  
  $options=array(0=>'None','h1'=>'H1','h2'=>'H2','h3'=>'H3','h4'=>'H4','h5'=>'H5','h6'=>'H6','p'=>'P','span'=>'SPAN','div'=>'DIV');
   parent::options_form($form, $form_state);
    foreach($form['grouping'] as $i=>$value)
  {
  $grouping = !empty($this->options['grouping'][$i]) ? $this->options['grouping'][$i] : array();
   $grouping +=array('grouping_class'=>''); 
  $form['grouping'][$i]['grouping_class']=array('#title'=>t('Grouping Class of  field Nr.@number', array('@number' => $i + 1)),
                                               '#type'=>'textfield',
											   '#description'=>'Enter your class css separated by space',
											   '#default_value'=>$grouping['grouping_class'],
											   );
  }		
	$form['tag']=array('#title'=>t('Tag'),
	                   '#type'=>'select',
					   '#options'=>$options,
					   '#default_value'=>$this->options['tag'],
					   ); 
   $form['group_row']=array('#title'=>t('Grouping Rows'),
                            '#type'=>'fieldset',
                            '#collapsible'=>TRUE,
 							'#collapsed'=>($this->options['row_count']>0),
							);
							
   $form['group_row']['row_count']=array('#title'=>t('Row  Count'),
                                         '#type'=>'textfield',
										 '#default_value'=>$this->options['row_count'],
										 '#required'=>TRUE,
										 '#description'=>t('If your enter 0, it wont do anything group'),
										 '#element_validate'=>array('row_count_validate'),
										 );
  $form['group_row']['group_class']=array('#title'=>t('Group Class'),
                                         '#type'=>'textfield',
										 '#default_value'=>$this->options['group_class'],
										 '#description'=>t('Enter your class separated by space'),
										 ); 	
										
   										 
  }

    
  
  
}
