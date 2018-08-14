<?php
// Upload svg image
function my_myme_types($mime_types){

    $mime_types['svg'] = 'image/svg+xml'; //Adding svg extension

    return $mime_types;
}

add_filter('upload_mimes', 'my_myme_types', 1, 1);


//show gravity form after submission
add_filter( 'gform_pre_submission_filter' , "foo_show_confirmation_and_form" , 10 , 1 );
function foo_show_confirmation_and_form($form) {
  $shortcode = '[gravityform id="' . $form['id'] . '" title="false" description="false"]';

  if ( array_key_exists( 'confirmations' , $form ) ) {
    foreach ( $form[ 'confirmations' ] as $key => $confirmation ) {
      $form[ 'confirmations' ][ $key ][ 'message' ] .= $shortcode;
    }
  }

  if ( array_key_exists( 'confirmation' , $form ) ) {
    $form[ 'confirmation' ][ 'message' ] .= $shortcode;
  }
  return $form;
}