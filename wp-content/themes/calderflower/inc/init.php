<?php
// Load all required files
$cf_includes = array(
	'inc/cf_function_def.php',
	'inc/custom-header.php',
	'inc/template-tags.php',
	'inc/template-functions.php',
	'inc/customizer.php',
	'inc/lib/walker_menu.php',
	'inc/assets.php',
	'inc/widgets.php',
	'inc/acf_options.php',
	'inc/setup_site.php',
	'inc/menu.php',
	'inc/social-icon.php',
	'inc/admin/init.php',

);


/**
 * Load Jetpack compatibility file.
 */
if ( defined( 'JETPACK__VERSION' ) ) {
	$cf_includes[] = 'inc/jetpack.php';
}

/**
 * Load WooCommerce compatibility file.
 */
if ( class_exists( 'WooCommerce' ) ) {
	$cf_includes[] = 'inc/woocommerce.php';
}

// Load the templates
foreach ( $cf_includes as $cf_include ) {
	if ( file_exists( get_template_directory() . '/' . $cf_include ) ) {
		locate_template( $cf_include, true, true );
	}
}
unset( $cf_include );