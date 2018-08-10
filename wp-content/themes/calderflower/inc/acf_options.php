<?php
/* ACF custom field */
if( function_exists('acf_add_options_page') ) {

	acf_add_options_page(array(
		'page_title' 	=> 'Calder Flower General Settings',
		'menu_title'	=> 'Calder Flower Settings',
		'menu_slug' 	=> 'cf-general-settings',
		'capability'	=> 'edit_posts',
		'redirect'		=> false
	));

}