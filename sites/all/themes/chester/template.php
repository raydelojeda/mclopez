<?php
function chester_preprocess_html(&$vars) {
  
 $color=array('0088CC'=>'blue','E64B3C'=>'red','DBC404'=>'yellow','88C425'=>'green','F29B18'=>'orange');
if($_GET['q']== variable_get('site_frontpage'))
 $vars['skin']=drupal_get_path('theme','chester') . '/css/skins/'.$color[theme_get_setting('color')].'/'.$color[theme_get_setting('color')].'.css';
 else
 drupal_add_css(path_to_theme() . '/css/skins/'.$color[theme_get_setting('color')].'/'.$color[theme_get_setting('color')].'.css',array('group' => CSS_THEME,'media'=>'screen','every_page'=>TRUE,'weight'=>1));
 }
 function chester_preprocess_user_picture(&$vars)
{
$vars['user_picture'] = '';
  if (variable_get('user_pictures', 0)) {
    $account = $vars['account'];
    if (!empty($account->picture)) {
      // @TODO: Ideally this function would only be passed file objects, but
      // since there's a lot of legacy code that JOINs the {users} table to
      // {node} or {comments} and passes the results into this function if we
      // a numeric value in the picture field we'll assume it's a file id
      // and load it for them. Once we've got user_load_multiple() and
      // comment_load_multiple() functions the user module will be able to load
      // the picture files in mass during the object's load process.
      if (is_numeric($account->picture)) {
        $account->picture = file_load($account->picture);
      }
      if (!empty($account->picture->uri)) {
        $filepath =file_create_url($account->picture->uri);
      }
    }
    elseif (variable_get('user_picture_default', '')) {
      $filepath = file_create_url(variable_get('user_picture_default', ''));
    }
    if (isset($filepath)) {
      $vars['user_picture'] = t('<img alt="Visitor1" src="@path"/>',array('@path'=>$filepath));
     }
  }
} 
function chester_fancybox_imagefield($variables) {
 $path = $variables['path'];
 $caption = $variables['caption'];
  $group = $variables['group'];
 return l('Zoom',$path, array('html' => TRUE, 'attributes' => array('title' => $caption,'class' => 'fancybox','data-fancybox-group' => $group,),));
}
function chester_form_contact_site_form_alter(&$form,&$form_state)
{
$form['#prefix']=t('<div class="row-fluid">
                       <div class="span4 title">
                        <span class="arrow_leftb"></span>
                        <h3>Contact Us</h3>
                        <h1>Do not hesitate to write!</h1>
                        <p>@vision</p>                        
                        <h4>Central Office</h4>                                  
                        @office <br>
                        Tel: @phone <br>                        
                        Email: <a href="mailto:#">@email</a><br>
                       </div>
					<div class="span8 contact">
                     <h3>Contact Form</h3>', array('@vision'=>theme_get_setting('vision'),
					                               '@office'=>theme_get_setting('address'),
												   '@phone'=>theme_get_setting('phone'),
												   '@email'=>theme_get_setting('email'))
												   );
$form['#suffix']='</div></div>';					 
 $form['name']=array(
    '#type' => 'textfield',
    '#required' => TRUE,
    '#attributes'=>array('placeholder'=>"Name",'title'=> 'Por favor,rellene este campo.'),
    );
  $form['mail'] = array(
    '#type' => 'textfield',
    '#attributes'=>array('placeholder'=>"Email",'class'=>array('email'),'title'=> 'Por favor,rellene este campo.'),
    '#required' => TRUE,
  );
   $form['subject'] = array(
    '#type' => 'textfield',
    '#attributes'=>array('placeholder'=>"Subject",'title'=> 'Por favor,rellene este campo.'),
    '#required' => TRUE,
  );
   unset($form['message']['#title']);
   $form['message']['#attributes']=array('placeholder'=>"Your message" ,'title'=> 'Por favor,rellene este campo.');
   unset($form['copy']);
   $form['actions']['submit']['#value']=t('Send');
   $form['actions']['submit']['#attributes']=array('class'=>array('button')); 	
}
function chester_form_comment_form_alter(&$form, &$form_state)
{
 global $user;	
 $form['#attributes']['class']=array('form-comment');
 unset($form['author']['_author']);
 unset($form['subject']);
 
 if(!$user->uid)
 {
 	$form['author']['name'] = array(
      '#type' => 'textfield',
      '#required' => TRUE,
      '#attributes'=>array('placeholder'=>t('Name'))
    );
     $form['author']['mail'] = array(
    '#type' => 'textfield',
    '#required' => TRUE,
    '#attributes'=>array('placeholder'=>t('Email'))
  );
 }
 $form['actions']['submit']['#attributes']['class'] = array('button');
  $form['actions']['submit']['#value']='Send Comment';
 $form['actions']['preview']['#attributes']['class'] = array('button');
 $form['comment_body']['und'][0]['#attributes']['placeholder']=t('Your Message');
 unset($form['comment_body']['und'][0]['#title']);
 
}
function chester_form_newsletter_subscribe_form_alter(&$form, &$form_state)
{
   $form['email'] = array(
      '#type' => 'textfield',
      '#attributes'=>array('placeholder'=>utf8_encode('Tu correo electrónico')),
      '#required' => TRUE,
	  );
   $form['newsletter-submit']['#value']=t(utf8_encode('Regístrate'));
   $form['newsletter-submit']['#attributes']['class']=array('button');
 }
 

