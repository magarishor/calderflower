<?php
/*
Template Name: Meet The Team
*/
 get_header();
  while( have_posts() ) :
    the_post();
    $feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) );
    $feature_img_first = get_field( 'featured_image_first' );
    $feature_img_second = get_field( 'featured_image_second' );
?>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Projects Sldier : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="container project-banner" id="meet-team-banner">
        <div class="row no-gutters">
            <div class="col-lg-4 projects-bnr-left">
                <h1><?php the_title();?></h1>
               <?php the_content();?>
            </div>
            <div class="col-lg-8 right-top">
                <img class="img-fluid img-top" src="<?php echo $feature_img; ?>" alt="<?php the_title();?>">
                <div class="img-btm-wrap">
                    <img class="img-fluid img-bottom" src="<?php echo $feature_img_first['url']; ?>" alt="<?php echo $feature_img_first['alt']; ?>">
                    <img class="img-fluid img-bottom" src="<?php echo $feature_img_second['url']; ?>" alt="<?php echo $feature_img_second['alt']; ?>">
                </div>
            </div>
        </div>
    </div>
<?php
    endwhile;
    wp_reset_postdata();
    ?>


<?php get_template_part( 'template-parts/team/content', 'teamblock' ); ?>

<?php get_template_part( 'template-parts/home/content', 'letstalk' ); ?>

<?php get_template_part( 'template-parts/home/content', 'copyright' ); ?>

<?php get_footer(); ?>