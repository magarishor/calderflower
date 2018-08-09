<?php
/**
 * The header for our theme
 *
 * This is the template that displays all of the <head> section and everything up until <div id="content">
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package calderflower
 */

?>
<!DOCTYPE html>
<html <?php language_attributes(); ?>>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href="https://fonts.googleapis.com/css?family=Barlow+Semi+Condensed:300,400,500,600,700" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ"
    crossorigin="anonymous">
	<?php wp_head(); ?>
</head>

<body <?php body_class(); ?>>
<div id="site-wrapper" v-bind:class="{ shiftRight }">
    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   :::::: Header Section : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <nav id="site-navigation" class="main-navigation" v-bind:class="{ shiftRight }">

        <div id="primary-menu" class="menu">
            <?php
		    wp_nav_menu( array(
              'menu'              => 'Primary',
              'theme_location'    => '',
              'depth'             => 0,
              'container'         => '',
              'container_class'   => '',
              'container_id'      => '',
              'menu_class'        => 'nav-menu',
              'fallback_cb'       => 'wp_bootstrap_navwalker::fallback',
              'walker'            => new WP_Bootstrap_Navwalker())
              );?>
        </div>
         <?php cf_social_icons_output(); ?>
    </nav>

    <div id="header">
        <div class="container">
            <div class="row">
                <div class="col-4 d-flex align-items-center">
                    <div id="dp-hamburger"  v-bind:class="{ change }" v-on:click="dpToggleMenu">
                        <div class="bar1"></div>
                        <div class="bar2"></div>
                        <div class="bar3"></div>
                        <span id="menu-text"> {{ menu }}</span>
                    </div>
                </div>
                <div class="col-4 d-flex justify-content-center align-items-center">
                	<?php
                	 $custom_logo_id = get_theme_mod( 'custom_logo' );
					         $image = wp_get_attachment_image_src( $custom_logo_id , 'full' );
					         ?>
                    <a href="#">
                        <img class="img-fluid site-logo" src="<?php echo $image[0]; ?>" alt="logo">
                    </a>
                </div>
                <div class="col-4 d-flex justify-content-end align-items-center">
                  <?php cf_social_icons_output(); ?>
                </div>
            </div>
        </div>
    </div>
