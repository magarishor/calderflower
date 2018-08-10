<?php
function menu_fetch( $menu_name, $menu_class ){

	 wp_nav_menu( array(
              'menu'              => $menu_name,
              'theme_location'    => '',
              'depth'             => 0,
              'container'         => '',
              'container_class'   => '',
              'container_id'      => '',
              'menu_class'        => $menu_class,
              'fallback_cb'       => 'wp_bootstrap_navwalker::fallback',
              'walker'            => new WP_Bootstrap_Navwalker())
              );
}