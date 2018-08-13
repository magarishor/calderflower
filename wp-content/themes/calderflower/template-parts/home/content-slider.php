<!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Banner Sldier : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
<div class="container home-banner">
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