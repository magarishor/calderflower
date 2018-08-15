<?php

// Custom post type - milestone.
class CF_Type_Team {

	public function __construct() {
		add_action( 'init', array( &$this, 'calder_flower_milestone_init' ) );
		add_action( 'init', array( &$this, 'calderflower_create_milestone_taxonomies' ), 0 );
	}

	/**
	 * Register a milestone post type.
	 */
	public function calder_flower_milestone_init() {
		$labels = array(
			'name'               => _x( 'Milestone', 'post type general name', 'calderflower' ),
			'singular_name'      => _x( 'Milestone', 'post type singular name', 'calderflower' ),
			'menu_name'          => _x( 'Milestone', 'admin menu', 'calderflower' ),
			'name_admin_bar'     => _x( 'Milestone', 'add new on admin bar', 'calderflower' ),
			'add_new'            => _x( 'Add New', 'milestone', 'calderflower' ),
			'add_new_item'       => __( 'Add New Milestone', 'calderflower' ),
			'new_item'           => __( 'New Milestone', 'calderflower' ),
			'edit_item'          => __( 'Edit Milestone', 'calderflower' ),
			'view_item'          => __( 'View Milestone', 'calderflower' ),
			'all_items'          => __( 'All Milestone', 'calderflower' ),
			'search_items'       => __( 'Search Milestone', 'calderflower' ),
			'parent_item_colon'  => __( 'Parent Milestone:', 'calderflower' ),
			'not_found'          => __( 'No milestones found.', 'calderflower' ),
			'not_found_in_trash' => __( 'No milestones found in Trash.', 'calderflower' )
		);

		$args = array(
			'labels'             => $labels,
			'public'             => false,
			'publicly_queryable' => false,
			'show_ui'            => true,
			'show_in_menu'       => true,
			'query_var'          => true,
			'rewrite'            => array( 'slug' => 'milestone' ),
			'capability_type'    => 'post',
			'has_archive'        => false,
			'hierarchical'       => false,
			'menu_position'      => null,
			'supports'           => array( 'title', 'editor', 'thumbnail', ),
			// 'menu_icon'			 => 'dashicons-slides',
		);

		register_post_type( 'milestone', $args );
	}

	// Create taxonomies
	public function calderflower_create_milestone_taxonomies() {
		$labels = array(
			'name'              => _x( 'Category', 'taxonomy general name', 'calderflower' ),
			'singular_name'     => _x( 'Category', 'taxonomy singular name', 'calderflower' ),
			'search_items'      => __( 'Search Category', 'calderflower' ),
			'all_items'         => __( 'All Category', 'calderflower' ),
			'parent_item'       => __( 'Parent Category', 'calderflower' ),
			'parent_item_colon' => __( 'Parent Category:', 'calderflower' ),
			'edit_item'         => __( 'Edit Category', 'calderflower' ),
			'update_item'       => __( 'Update Category', 'calderflower' ),
			'add_new_item'      => __( 'Add New Category', 'calderflower' ),
			'new_item_name'     => __( 'New Category Name', 'calderflower' ),
			'menu_name'         => __( 'Category', 'calderflower' ),
		);

		$args = array(
			'hierarchical'      => true,
			'labels'            => $labels,
			'show_ui'           => true,
			'show_admin_column' => true,
			'query_var'         => true,
			'rewrite'           => array( 'slug' => 'milestone/category' ),
		);

		register_taxonomy( 'cfcategory_type', array( 'milestone' ), $args );
	}
}

// Run!
new CF_Type_Team();
