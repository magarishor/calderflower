<?php
/**
 * Template part for displaying posts
 *
 * @link https://developer.wordpress.org/themes/basics/template-hierarchy/
 *
 * @package calderflower
 */

?>

<!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Banner Sldier : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->


    <div class="container home-banner">
        <?php
        get_template_part( 'template-parts/home/content', 'slider' );?>

        <!-- Bottom Banner Arrow Text -->
        <div class="row">
            <div class="arrow-text">
                <i class="fas fa-chevron-down"></i>
                <p><?php the_content();?></p>
            </div>
        </div>
    </div>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Featured Work : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="featured-work">
        <h3 class="section-title">Featured work</h3>
        <div class="container">
            <div class="row no-gutters">
            	<?php
            	$args_projects = array(
		          'post_type'=>'project',
		          'orderby'  => 'date',
		          'order' => 'DESC'
		          );
				// The Query
				$query_projects = new WP_Query( $args_projects );
				while ( $query_projects->have_posts() ) :
				$query_projects->the_post();
				$img = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'full' );

				?>
                <div class="col-lg-4">
                    <div class="work-block">
                        <img src="<?php echo $img[0];?>" alt="Avatar" class="img-fluid work-image">
                        <div class="work-middle">
                            <p> <span><?php echo get_field( 'projects_subtitle' );?> </span> |<?php the_title();?></p>
                            <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
                        </div>
                    </div>
                </div>
            	<?php
        		endwhile;
            	wp_reset_postdata();
            	?>
                <div class="btn-wrap-center">
                    <a href="<?php echo esc_url( home_url( '/projects' ) ); ?>" class="site-btn btn-orange">See more</a>
                </div>
            </div>
        </div>
    </div>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Form Map : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="form-map">
    	<?php $letstalk = get_field('cf_home_lets_talk');?>
        <span class="heading-title"><?php echo $letstalk['cf_home_lets_talk_description'];?></span>
        <div class="btn-wrap-center">
            <a href="#" class="site-btn btn-green"><?php echo $letstalk['cf_home_lets_talk_title'];?></a>
        </div>
        <div class="container">
            <div class="row no-gutters">

                <!-- Form -->
                <div class="col">
                    <div class="form-wrap">
                       <?php echo $letstalk['cf_home_leave_us_an_enquiry_form'];?>
                    </div>
                </div>

               <!-- map -->
                <div class="col">
                    <div id="map" style=" height: 500px; width: 100%;"></div>
                </div>

            </div>
        </div>
    </div>


     <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Instagram : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="instagram-block">
        <h3 class="section-title">What’s happening on Instagram</h3>
        <div class="container">
            <div class="insta-feed">
            <?php echo do_shortcode('[instagram-feed showheader=false num=6 cols=6 showfollow=false]');?>
            </div>
        </div>
    </div>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Copyright : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->

    <div class="copyright-block">
        <div class="container">
            <div class="row">
                <div class="col-6">
                <?php $copyright = get_theme_mod( 'footer_copyright_setting' );?>
                <p><?php echo $copyright;?></p>
            </div>

             <div class="col-6 d-flex justify-content-end align-items-center">
                <?php cf_social_icons_output(); ?>
            </div>
            </div>
        </div>
    </div>