<?php
function chester_form_system_theme_settings_alter(&$form, &$form_state) {
$form['my_setting']=array(
                          '#title'=>t('General Setting'),
						  '#type'=>'fieldset',
						  '#collapsible' => TRUE,
                          );
$form['my_setting']['email']=array(
                     '#title'=>t('Email'),
					 '#type'=>'textfield',
					 '#required'=>TRUE,
                     '#default_value'=>theme_get_setting('email','chester'),
					 
); 
$form['my_setting']['phone']=array(
                     '#title'=>t('Phone'),
					 '#type'=>'textfield',
					 '#required'=>TRUE,
                     '#default_value'=>theme_get_setting('phone','chester'),
					 
);
$form['my_setting']['address']=array(
                     '#title'=>t('Address'),
					 '#type'=>'textarea',
					 '#required'=>TRUE,
                     '#default_value'=>theme_get_setting('address','chester'),
					 
);
$form['my_setting']['mision']=array(
                     '#title'=>t('Mision'),
					 '#type'=>'textarea',
					 '#required'=>TRUE,
                     '#default_value'=>theme_get_setting('mision','chester'),
					 
);
$form['my_setting']['vision']=array(
                     '#title'=>t('Vision'),
					 '#type'=>'textarea',
					 '#required'=>TRUE,
                     '#default_value'=>theme_get_setting('vision','chester'),
					 
);

$form['my_setting']['picture'] = array(
'#type' => 'file',
'#title' => t('Upload picture'),
'#size' => 48,
'#description' => t('Your virtual face or picture.'),
);
//print_r(variable_get('theme_chester_settings'));
if(theme_get_setting('picture_path','chester')!='')
$form['my_setting']['delete_picture']=array('#type'=>'checkboxes',
                                            '#options'=>array('1'=>t('Delete')),
											'#suffix'=>'<div><img width="200" height="150" src="'.file_create_url(theme_get_setting('picture_path','chester')).'" /></div>'
											);
$form['color_setting']=array(
                          '#title'=>t('Color'),
						  '#type'=>'fieldset',
						  
);
$form['color_setting']['color']=array(
                                      '#type'=>'radios',
									  '#options'=>array('0088CC'=>'Blue','E64B3C'=>'Red','DBC404'=>'Yellow','88C425'=>'Green','F29B18'=>'Orange'),
									  '#default_value'=>theme_get_setting('color','chester'),
);
drupal_add_js('jQuery(document).ready(function(){jQuery(".form-item-color").css({display:"inline-block",width:"100px"});
                                                jQuery(":radio[name=color]").each(function(){jQuery("label[for="+this.id+"]").css("color","#"+this.value);}); })','inline');
$form['#validate'][] ='chester_theme_settings_validate';	
$form['#submit'][] = 'chester_theme_settings_submit';	
}
function chester_theme_settings_validate($form, &$form_state)
{
 $validators = array('file_validate_is_image' => array());
 $file = file_save_upload('picture', $validators);
 if (isset($file)) {
    
    if ($file) {
      // Put the temporary file in form_values so we can save it on submit.
      $form_state['values']['picture'] = $file;
    }
    else {
      // File upload failed.
      form_set_error('picture', t('The picture could not be uploaded.'));
    }
  }
}
    
function chester_theme_settings_submit($form, &$form_state)	{
 $v= variable_get('theme_chester_settings');
  if (isset($form_state['values']['picture'])) 
  {
   if( $file = $form_state['values']['picture'])
  {
     unset($form_state['values']['picture']);
    $filename = file_unmanaged_copy($file->uri);
    $form_state['values']['picture_path'] = $filename;
	if(isset($v['picture_path']) && $form_state['values']['delete_picture'])
	{
	$del_file=str_replace('public://','sites/default/files/',$v['picture_path']);
    file_unmanaged_delete($del_file);
	}
   }
   else
   $form_state['values']['picture_path'] = $v['picture_path'];
  }
  elseif($form_state['values']['delete_picture'])
   {
    $del_file=str_replace('public://','sites/default/files/',$v['picture_path']);
    file_unmanaged_delete($del_file);
   }
   else
   $form_state['values']['picture_path'] = $v['picture_path'];  
 
}

