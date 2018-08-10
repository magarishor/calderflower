<?php
/**
 * Enqueue scripts and styles.
 */
function calderflower_scripts() {
	//wp_enqueue_style( 'calderflower-style', get_stylesheet_uri() );
	wp_enqueue_style('bootstrap', get_template_directory_uri() . '/assets/css/bootstrap.min.css', array());
	wp_enqueue_style('slick', get_template_directory_uri() . '/assets/css/slick.css', array());
	wp_enqueue_style('custom', get_template_directory_uri() . '/assets/css/custom.css', array());

	//wp_enqueue_script( 'calderflower-navigation', get_template_directory_uri() . '/js/navigation.js', array(), '20151215', true );
	//wp_enqueue_script( 'calderflower-skip-link-focus-fix', get_template_directory_uri() . '/js/skip-link-focus-fix.js', array(), '20151215', true );
	wp_enqueue_script('jquery', get_template_directory_uri() . '/assets/js/jquery.js', array('jquery') , '4.0.0');
	wp_enqueue_script('bootstrap-jquery', get_template_directory_uri() . '/assets/js/bootstrap.min.js', array('jquery') , '4.0.0');
	wp_enqueue_script('slick-min-jquery', get_template_directory_uri() . '/assets/js/slick.min.js', array('jquery') , '4.0.0');
	wp_enqueue_script('vue-jquery', get_template_directory_uri() . '/assets/js/vue.js');
	wp_enqueue_script( 'script-name', get_template_directory_uri() . '/assets/js/custom.js', array(), '1.0.0', true );

	if ( is_singular() && comments_open() && get_option( 'thread_comments' ) ) {
		wp_enqueue_script( 'comment-reply' );
	}
}
add_action( 'wp_enqueue_scripts', 'calderflower_scripts' );