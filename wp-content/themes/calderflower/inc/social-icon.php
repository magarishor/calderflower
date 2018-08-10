<?php
//social icon customizer
function calder_social_array() {

	$social_sites = array(
		'linkedin'      => 'calder_linkedin_profile',
		'facebook'      => 'calder_facebook_profile',
		'pinterest'     => 'calder_pinterest_profile',
		'twitter'       => 'calder_twitter_profile',
		'instagram'     => 'calder_instagram_profile',
		'google-plus'   => 'calder_googleplus_profile',
		'youtube'       => 'calder_youtube_profile',
		'vimeo'         => 'calder_vimeo_profile',
		'skype'         => 'calder_skype_profile',
		'wechat'        => 'calder_wechat_profile',
	);

	return apply_filters( 'calder_social_array_filter', $social_sites );
}


//social icon frontend
function cf_social_icons_output() {

	$social_sites = calder_social_array();

	foreach ( $social_sites as $social_site => $profile ) {

		if ( strlen( get_theme_mod( $social_site ) ) > 0 ) {
			$active_sites[ $social_site ] = $social_site;
		}
	}

	if ( ! empty( $active_sites ) ) {

		echo '<ul class="social-media-icons" id="top-social">';
		foreach ( $active_sites as $key => $active_site ) {
        	$class = 'fab fa fa-' . $active_site; ?>
		 	<li>
				<a class="<?php echo esc_attr( $active_site ); ?>" target="_blank" href="<?php echo esc_url( get_theme_mod( $key ) ); ?>">
					<i class="<?php echo esc_attr( $class ); ?>" title="<?php echo esc_attr( $active_site ); ?>"></i>
				</a>
			</li>
		<?php }
		echo "</ul>";
	}
}