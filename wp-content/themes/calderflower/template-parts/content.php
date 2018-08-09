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
    <?php
        $args = array(
          'post_type'=>'slider',
          'orderby'  => 'date',
          'showposts' => -1  ,
          'order' => 'DESC'
          );
         $the_query = new WP_Query( $args );
	        $cnt=0;
	        $homesliders = array();
	        while ( $the_query->have_posts() ) :
			$the_query->the_post();
	          $img = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'full' );
	          $homesliders[$cnt]['title'] = get_the_title();
	          $homesliders[$cnt]['image'] = $img[0];
	          $homesliders[$cnt]['subtitle'] = get_post_meta( get_the_ID(),'cf_home_subtitle',true );
	          $homesliders[$cnt]['firstbutton'] = get_field('first_button');
	          $homesliders[$cnt]['secondbutton'] = get_field('second_button');
	          $cnt++;
        	endwhile;
        wp_reset_postdata();
      ?>
    <div class="container home-banner">
        <div class="row no-gutters">
            <div class="col-6">
                <div class="slider-for">
            	<?php
            		foreach( $homesliders as $homeslider ){
            		?>
                    <div class="home-bnr-img">
                        <img src="<?php echo $homeslider['image']; ?>" alt="home-banner">
                    </div>
                    <?php }?>
                </div>
            </div>
            <div class="col-6">
            <div class="right-banner">
                <div class="right-top-sldr slider-nav">
                	<?php
            		foreach( $homesliders as $homeslider ){
            		?>
                    <div class="home-bnr-text">
                        <h2><?php echo $homeslider['title']; ?></h2>
                        <span class="slider-cat"><?php echo $homeslider['subtitle']; ?></span>
                        <a href="<?php echo $homeslider['firstbutton']['first_button_url']; ?>" class="site-btn btn-orange"><?php echo $homeslider['firstbutton']['first_button_name']; ?></a>
                        <a href="<?php echo $homeslider['secondbutton']['second_button_url']; ?>" class="site-btn btn-green"><?php echo $homeslider['secondbutton']['second_button_name']; ?></a>
                    </div>
                <?php } ?>
                </div>
                <div class="right-btm-sldr">
                	<?php $slider_option = get_field('slider_settings','option') ?>
                    <a href="<?php echo $slider_option['view_our_projects_url']; ?>" class="bnr-page-blk bnr-projects">
                       <?php echo $slider_option['view_our_projects_title']; ?>
                    </a>
                    <a href="<?php echo $slider_option['meet_our_team_url']; ?>" class="bnr-page-blk bnr-team">
                       <?php echo $slider_option['meet_our_team_title']; ?>
                    </a>
                    <a href="<?php echo $slider_option['read_our_news_url']; ?>" class="bnr-page-blk bnr-news">
                      <?php echo $slider_option['read_our_news_title']; ?>
                    </a>
                </div>
            </div>
            </div>
        </div>

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
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3312.100207337743!2d151.19609431570316!3d-33.88707298065119!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6b12b1d7f13a5e6d%3A0x84538a52282d279d!2sCalder+Flower+Architects+Pty+Ltd!5e0!3m2!1sen!2snp!4v1533788912992"
                     width="100%" height="500" frameborder="0" style="border:0" allowfullscreen></iframe>
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

