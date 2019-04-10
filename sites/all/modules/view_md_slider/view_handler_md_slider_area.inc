<?php
class view_handler_md_slider_area extends views_handler_area{
function option_definition(){
$options=parent::option_definition();
$options['md_slider_machine_name']=array('default'=>NULL);
$options['wrap_class']=array('default'=>'');
return $options;
}
function options_form(&$form, &$form_state)
{
 parent::options_form($form, $form_state);
 $sliders=MDSlider::get_all();
 $slider_options=array();
 foreach($sliders as $slider)
 $slider_options[$slider->machine_name]=$slider->title;
 $form['md_slider_machine_name']=array('#title'=>t('MD Slider'),
                     '#type'=>'select',
					 '#options'=>$slider_options,
					 '#default_value'=>$this->options['md_slider_machine_name'],
					 );	
$form['wrap_class']=array('#title'=>t('wrap class'),
                          '#type'=>'textfield',
						  '#default_value'=>$this->options['wrap_class'],
						  );					 
}
function render($empty = FALSE) {
   
    if (!$empty || !empty($this->options['empty'])) {
	$output=md_slider_view($this->options['md_slider_machine_name']);
	if($this->options['wrap_class']!='')
	$output=t('<div class="@class">'.$output.'</div>',array('@class'=>$this->options['wrap_class']));
     return $output;
    }
    return '';
  }
} 
