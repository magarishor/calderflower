<?php
/**
 * calderflower Theme Customizer
 *
 * @package calderflower
 */

/**
 * Add postMessage support for site title and description for the Theme Customizer.
 *
 * @param WP_Customize_Manager $wp_customize Theme Customizer object.
 */
function calderflower_customize_register( $wp_customize ) {
	$wp_customize->get_setting( 'blogname' )->transport         = 'postMessage';
	$wp_customize->get_setting( 'blogdescription' )->transport  = 'postMessage';
	$wp_customize->get_setting( 'header_textcolor' )->transport = 'postMessage';

	if ( isset( $wp_customize->selective_refresh ) ) {
		$wp_customize->selective_refresh->add_partial( 'blogname', array(
			'selector'        => '.site-title a',
			'render_callback' => 'calderflower_customize_partial_blogname',
		) );
		$wp_customize->selective_refresh->add_partial( 'blogdescription', array(
			'selector'        => '.site-description',
			'render_callback' => 'calderflower_customize_partial_blogdescription',
		) );
	}
}
add_action( 'customize_register', 'calderflower_customize_register' );


/*Theme Header Option*/
add_action('customize_register', 'theme_option_customizer');
function theme_option_customizer($wp_customize){
 	//adding section in wordpress customizer
	$wp_customize->add_section('theme_settings_section', array(
  		'title'          => 'Site Option',
  		'priority'    => 25,
 		));


	//contact ->text
	$wp_customize->add_setting('header_address_setting', array(
 	'default'        => '',
 	));
	$wp_customize->add_control('header_address_setting', array(
 	'label'   => 'Contact',
  	'section' => 'theme_settings_section',
 	'type'    => 'text',
	));

	//contact ->email
	$wp_customize->add_setting('header_email_setting', array(
 	'default'        => '',
 	));
	$wp_customize->add_control('header_email_setting', array(
 	'label'   => 'Email Address',
  	'section' => 'theme_settings_section',
 	'type'    => 'text',
	));

	//contact ->email
	$wp_customize->add_setting('footer_copyright_setting', array(
 	'default'        => '',
 	));
	$wp_customize->add_control('footer_copyright_setting', array(
 	'label'   => 'Copyright',
  	'section' => 'theme_settings_section',
 	'type'    => 'textarea',
	));


	}

function social_icon_customizer_sections( $wp_customize ) {

	$social_sites = calder_social_array();

	// set a priority used to order the social sites
	$priority = 5;

	// section
	$wp_customize->add_section( 'calder_social_media_icons', array(
		'title'       => __( 'Social Media Icons', 'tribes' ),
		'priority'    => 25,
		'description' => __( 'Add the URL for each of your social profiles.', 'tribes' )
	) );

	// create a setting and control for each social site
	foreach ( $social_sites as $social_site => $value ) {

		$label = ucfirst( $social_site );

		if ( $social_site == 'google-plus' ) {
			$label = 'Google Plus';
		} elseif ( $social_site == 'rss' ) {
			$label = 'RSS';
		} elseif ( $social_site == 'soundcloud' ) {
			$label = 'SoundCloud';
		} elseif ( $social_site == 'slideshare' ) {
			$label = 'SlideShare';
		} elseif ( $social_site == 'codepen' ) {
			$label = 'CodePen';
		} elseif ( $social_site == 'stumbleupon' ) {
			$label = 'StumbleUpon';
		} elseif ( $social_site == 'deviantart' ) {
			$label = 'DeviantArt';
		} elseif ( $social_site == 'hacker-news' ) {
			$label = 'Hacker News';
		} elseif ( $social_site == 'whatsapp' ) {
			$label = 'WhatsApp';
		} elseif ( $social_site == 'qq' ) {
			$label = 'QQ';
		} elseif ( $social_site == 'vk' ) {
			$label = 'VK';
		} elseif ( $social_site == 'wechat' ) {
				$label = 'WeChat';
		} elseif ( $social_site == 'tencent-weibo' ) {
			$label = 'Tencent Weibo';
		} elseif ( $social_site == 'paypal' ) {
			$label = 'PayPal';
		} elseif ( $social_site == 'email-form' ) {
			$label = 'Contact Form';
		}
		// setting
		$wp_customize->add_setting( $social_site, array(
			'sanitize_callback' => 'esc_url_raw'
		) );
		// control
		$wp_customize->add_control( $social_site, array(
			'type'     => 'url',
			'label'    => $label,
			'section'  => 'calder_social_media_icons',
			'priority' => $priority
		) );
		// increment the priority for next site
		$priority = $priority + 5;
	}
}
add_action( 'customize_register', 'social_icon_customizer_sections' );


/**
 * Render the site title for the selective refresh partial.
 *
 * @return void
 */
function calderflower_customize_partial_blogname() {
	bloginfo( 'name' );
}

/**
 * Render the site tagline for the selective refresh partial.
 *
 * @return void
 */
function calderflower_customize_partial_blogdescription() {
	bloginfo( 'description' );
}

/**
 * Binds JS handlers to make Theme Customizer preview reload changes asynchronously.
 */
function calderflower_customize_preview_js() {
	wp_enqueue_script( 'calderflower-customizer', get_template_directory_uri() . '/js/customizer.js', array( 'customize-preview' ), '20151215', true );
}
add_action( 'customize_preview_init', 'calderflower_customize_preview_js' );
