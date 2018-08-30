<?php
/* Template Name: Milestones */

get_header();

if ( have_posts() ) :
    while ( have_posts() ) :
        the_post();
        get_template_part( 'template-parts/milestone/content', 'milestone' );
        get_template_part( 'template-parts/home/content', 'letstalk' );
        get_template_part( 'template-parts/home/content', 'copyright' );
    endwhile;

else :

    get_template_part( 'template-parts/content', 'none' );

endif;

get_footer(); ?>