<?php
// Slider post type
register_post_type('slider', array(
	'labels' => array(
		'name' => __('Slider') ,
		'singular_name' => __('Slider')
	) ,
	'public' => true,
	'has_archive' => false,
	'publicly_queryable' => false,
	'show_in_menu' => true,
	'menu_position' => 20,
	'menu_icon' => 'dashicons-slides',
	'rewrite' => array(
		'slug' => 'slider'
	) ,
	'supports' => array(
		'title',
		'thumbnail'
	)
));


// Project post type
register_post_type('project', array(
	'labels' => array(
		'name' => __('Projects') ,
		'singular_name' => __('Project')
	) ,
	'public' => true,
	'has_archive' => false,
	'publicly_queryable' => false,
	'show_in_menu' => true,
	'menu_position' => 20,
	'menu_icon' => 'dashicons-move',
	'rewrite' => array(
		'slug' => 'project'
	) ,
	'supports' => array(
		'title',
		'thumbnail'
	)
));