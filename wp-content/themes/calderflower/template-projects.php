<?php
/* Template Name: Projects */

 get_header();
 while( have_posts() ) :
    the_post();
    $feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) );
    ?>
    <div class="container project-banner">
        <div class="row no-gutters">
            <div class="col-lg-4 projects-bnr-left">
                <h1><?php the_title(); ?></h1>
                <?php the_content();?>
            </div>
            <div class="col-lg-8">
                <img class="img-fluid" src="<?php echo $feature_img;?>" alt="<?php the_title();?>">
            </div>
        </div>
    </div>
<?php endwhile; ?>

<?php get_template_part( 'template-parts/project/content', 'project' ); ?>

<?php get_template_part( 'template-parts/home/content', 'letstalk' ); ?>

<?php get_template_part( 'template-parts/home/content', 'copyright' ); ?>

<?php get_footer(); ?>