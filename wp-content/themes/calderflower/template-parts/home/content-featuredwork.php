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
	          'order' => 'DESC',
              'posts_per_page' => '6',
              'meta_query'      => array(
                    array(
                        'key' => 'projects_featured',
                        'value' => true,
                        'compare' => '='
                        )
                    )
	          );
			// The Query
			$query_projects = new WP_Query( $args_projects );
			while ( $query_projects->have_posts() ) :
			$query_projects->the_post();
			$featured_image = get_field( 'projects_featured_image' );
			?>
            <div class="col-lg-4">
                <div class="work-block"  onclick="">
                    <img src="<?php echo $featured_image['project_square_image']['url'];?>" alt="Avatar" class="img-fluid work-image">
                    <div class="work-middle">
                        <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
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