<?php

if ( file_exists( dirname( __FILE__ ) . '/cmb2/init.php' ) ) {
	require_once dirname( __FILE__ ) . '/cmb2/init.php';
} elseif ( file_exists( dirname( __FILE__ ) . '/CMB2/init.php' ) ) {
	require_once dirname( __FILE__ ) . '/CMB2/init.php';
}


/* Metabox */
add_action( 'cmb2_admin_init', 'calder_flwr_register_home_page_metabox' );
/**
 * Hook in and add a metabox that only appears on the 'About' page
 */
function calder_flwr_register_home_page_metabox() {
	$prefix = 'calder_flwr_about_';

	/**
	 * Metabox to be displayed on a single page ID
	 */
	$cmb_home_page = new_cmb2_box( array(
		'id'           => $prefix . 'metabox',
		'title'        => esc_html__( 'Subtitle', 'cmb2' ),
		'object_types' => array( 'slider' ), // Post type
		'context'      => 'normal',
		'priority'     => 'high',
		'show_names'   => true, // Show field names on the left
	) );

	$cmb_home_page->add_field( array(
		'name' => esc_html__( 'Subtitle', 'cmb2' ),
		'desc' => esc_html__( 'eg: architecture + interiors', 'cmb2' ),
		'id'   => $prefix . 'subtitle',
		'type' => 'text',
	) );

}

add_action( 'cmb2_admin_init', 'button_first_group_metabox' );
/**
 * Hook in and add a metabox to demonstrate repeatable grouped fields
 */
function button_first_group_metabox() {
	$prefix = 'button_first_group_';

	$cmb_home_page = new_cmb2_box( array(
		'id'           => $prefix . 'metabox',
		'title'        => esc_html__( 'Button First Details', 'cmb2' ),
		'object_types' => array( 'slider' ),
	) );

	/*Button first*/
	$group_field_id = $cmb_home_page->add_field( array(
		'id'          => $prefix . 'button_first',
		'type'        => 'group',
		'repeatable'  => false, // use false if you want non-repeatable group

	) );

	$cmb_home_page->add_group_field( $group_field_id, array(
		'name'       => esc_html__( 'Button First Name', 'cmb2' ),
		'id'         => 'button_first_name',
		'type'       => 'text',

	) );

	$cmb_home_page->add_group_field( $group_field_id, array(
		'name'       => esc_html__( 'Button Url', 'cmb2' ),
		'id'         => 'button_first_url',
		'type'       => 'text',

	) );


}