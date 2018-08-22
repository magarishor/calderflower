<?php

// Custom post type - project.
class CF_Type_Project {

	public function __construct() {
		add_action( 'init', array( &$this, 'calder_flower_project_init' ) );
		add_action( 'init', array( &$this, 'calderflower_create_project_taxonomies' ), 0 );
	}

	/**
	 * Register a project post type.
	 */
	public function calder_flower_project_init() {
		$labels = array(
			'name'               => _x( 'Projects', 'post type general name', 'calderflower' ),
			'singular_name'      => _x( 'Project', 'post type singular name', 'calderflower' ),
			'menu_name'          => _x( 'Projects', 'admin menu', 'calderflower' ),
			'name_admin_bar'     => _x( 'Project', 'add new on admin bar', 'calderflower' ),
			'add_new'            => _x( 'Add New', 'project', 'calderflower' ),
			'add_new_item'       => __( 'Add New Project', 'calderflower' ),
			'new_item'           => __( 'New Project', 'calderflower' ),
			'edit_item'          => __( 'Edit Project', 'calderflower' ),
			'view_item'          => __( 'View Project', 'calderflower' ),
			'all_items'          => __( 'All Projects', 'calderflower' ),
			'search_items'       => __( 'Search Projects', 'calderflower' ),
			'parent_item_colon'  => __( 'Parent Projects:', 'calderflower' ),
			'not_found'          => __( 'No projects found.', 'calderflower' ),
			'not_found_in_trash' => __( 'No projects found in Trash.', 'calderflower' )
		);

		$args = array(
			'labels'             => $labels,
			'public'             => true,
			'publicly_queryable' => true,
			'show_ui'            => true,
			'show_in_menu'       => true,
			'query_var'          => true,
			'rewrite'            => array( 'slug' => 'project' ),
			'capability_type'    => 'post',
			'has_archive'        => true,
			'hierarchical'       => false,
			'menu_position'      => null,
			'supports'           => array( 'title', 'editor', ),
			// 'menu_icon'			 => 'dashicons-slides',
		);

		register_post_type( 'project', $args );
	}

	// Create taxonomies
	public function calderflower_create_project_taxonomies() {
		$labels = array(
			'name'              => _x( 'Category', 'taxonomy general name', 'calderflower' ),
			'singular_name'     => _x( 'Type', 'taxonomy singular name', 'calderflower' ),
			'search_items'      => __( 'Search Category', 'calderflower' ),
			'all_items'         => __( 'All Category', 'calderflower' ),
			'parent_item'       => __( 'Parent Type', 'calderflower' ),
			'parent_item_colon' => __( 'Parent Type:', 'calderflower' ),
			'edit_item'         => __( 'Edit Type', 'calderflower' ),
			'update_item'       => __( 'Update Type', 'calderflower' ),
			'add_new_item'      => __( 'Add New Type', 'calderflower' ),
			'new_item_name'     => __( 'New Type Name', 'calderflower' ),
			'menu_name'         => __( 'Category', 'calderflower' ),
		);

		$args = array(
			'hierarchical'      => true,
			'labels'            => $labels,
			'show_ui'           => true,
			'show_admin_column' => true,
			'query_var'         => true,
			'rewrite'           => array( 'slug' => 'project/category' ),
		);

		register_taxonomy( 'cfproject_type', array( 'project' ), $args );
	}


}

// Run!
new CF_Type_Project();
