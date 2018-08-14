<?php

// Custom post type - slider.
class CF_Type_Slider {

	public function __construct() {
		add_action( 'init', array( &$this, 'calder_flower_slider_init' ) );
	}

	/**
	 * Register a slider post type.
	 */
	public function calder_flower_slider_init() {
		$labels = array(
			'name'               => _x( 'Sliders', 'post type general name', 'calderflower' ),
			'singular_name'      => _x( 'Slider', 'post type singular name', 'calderflower' ),
			'menu_name'          => _x( 'Sliders', 'admin menu', 'calderflower' ),
			'name_admin_bar'     => _x( 'Slider', 'add new on admin bar', 'calderflower' ),
			'add_new'            => _x( 'Add New', 'slider', 'calderflower' ),
			'add_new_item'       => __( 'Add New Slider', 'calderflower' ),
			'new_item'           => __( 'New Slider', 'calderflower' ),
			'edit_item'          => __( 'Edit Slider', 'calderflower' ),
			'view_item'          => __( 'View Slider', 'calderflower' ),
			'all_items'          => __( 'All Sliders', 'calderflower' ),
			'search_items'       => __( 'Search Sliders', 'calderflower' ),
			'parent_item_colon'  => __( 'Parent Sliders:', 'calderflower' ),
			'not_found'          => __( 'No sliders found.', 'calderflower' ),
			'not_found_in_trash' => __( 'No sliders found in Trash.', 'calderflower' )
		);

		$args = array(
			'labels'             => $labels,
			'public'             => false,
			'publicly_queryable' => false,
			'show_ui'            => true,
			'show_in_menu'       => true,
			'query_var'          => true,
			'rewrite'            => array( 'slug' => 'slider' ),
			'capability_type'    => 'post',
			'has_archive'        => false,
			'hierarchical'       => false,
			'menu_position'      => null,
			'supports'           => array( 'title', 'thumbnail', ),
			// 'menu_icon'			 => 'dashicons-slides',
		);

		register_post_type( 'slider', $args );
	}
}

// Run!
new CF_Type_Slider();
