<?php

// Custom post type - testimonial.
class CF_Type_Team {

	public function __construct() {
		add_action( 'init', array( &$this, 'calder_flower_team_init' ) );
		add_action( 'init', array( &$this, 'calderflower_create_team_taxonomies' ), 0 );
	}

	/**
	 * Register a testimonial post type.
	 */
	public function calder_flower_team_init() {
		$labels = array(
			'name'               => _x( 'Team', 'post type general name', 'calderflower' ),
			'singular_name'      => _x( 'Team', 'post type singular name', 'calderflower' ),
			'menu_name'          => _x( 'Team', 'admin menu', 'calderflower' ),
			'name_admin_bar'     => _x( 'Team', 'add new on admin bar', 'calderflower' ),
			'add_new'            => _x( 'Add New', 'testimonial', 'calderflower' ),
			'add_new_item'       => __( 'Add New Team', 'calderflower' ),
			'new_item'           => __( 'New Team', 'calderflower' ),
			'edit_item'          => __( 'Edit Team', 'calderflower' ),
			'view_item'          => __( 'View Team', 'calderflower' ),
			'all_items'          => __( 'All Team', 'calderflower' ),
			'search_items'       => __( 'Search Team', 'calderflower' ),
			'parent_item_colon'  => __( 'Parent Team:', 'calderflower' ),
			'not_found'          => __( 'No testimonials found.', 'calderflower' ),
			'not_found_in_trash' => __( 'No testimonials found in Trash.', 'calderflower' )
		);

		$args = array(
			'labels'             => $labels,
			'public'             => false,
			'publicly_queryable' => false,
			'show_ui'            => true,
			'show_in_menu'       => true,
			'query_var'          => true,
			'rewrite'            => array( 'slug' => 'team' ),
			'capability_type'    => 'post',
			'has_archive'        => false,
			'hierarchical'       => false,
			'menu_position'      => null,
			'supports'           => array( 'title', 'thumbnail', ),
			// 'menu_icon'			 => 'dashicons-slides',
		);

		register_post_type( 'team', $args );
	}

	// Create taxonomies
	public function calderflower_create_team_taxonomies() {
		$labels = array(
			'name'              => _x( 'Types', 'taxonomy general name', 'calderflower' ),
			'singular_name'     => _x( 'Type', 'taxonomy singular name', 'calderflower' ),
			'search_items'      => __( 'Search Types', 'calderflower' ),
			'all_items'         => __( 'All Types', 'calderflower' ),
			'parent_item'       => __( 'Parent Type', 'calderflower' ),
			'parent_item_colon' => __( 'Parent Type:', 'calderflower' ),
			'edit_item'         => __( 'Edit Type', 'calderflower' ),
			'update_item'       => __( 'Update Type', 'calderflower' ),
			'add_new_item'      => __( 'Add New Type', 'calderflower' ),
			'new_item_name'     => __( 'New Type Name', 'calderflower' ),
			'menu_name'         => __( 'Types', 'calderflower' ),
		);

		$args = array(
			'hierarchical'      => true,
			'labels'            => $labels,
			'show_ui'           => true,
			'show_admin_column' => true,
			'query_var'         => true,
			'rewrite'           => array( 'slug' => 'team/type' ),
		);

		register_taxonomy( 'cfteam_type', array( 'team' ), $args );
	}
}

// Run!
new CF_Type_Team();
