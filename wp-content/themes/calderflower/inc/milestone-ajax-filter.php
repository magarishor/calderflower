<?php
add_action( 'wp_ajax_timeline_filter', 'timeline_filter' );
add_action( 'wp_ajax_nopriv_timeline_filter', 'timeline_filter' );

function timeline_filter(){
	$milestone_cat = $_POST['timeline_cat'];
	if( $milestone_cat == '' ){

		$args_mile = array(
	    'post_type'=>'milestone',
	    'orderby'  => 'date',
	    'order' => 'ASC',
	    'posts_per_page' => -1,
	    );
	}
	else{
	$args_mile = array(
	    'post_type'=>'milestone',
	    'orderby'  => 'date',
	    'order' => 'ASC',
	    'posts_per_page' => -1,
	    'tax_query' => array(
	        array(
	            'taxonomy' => 'cfcategory_type',
	            'field' => 'slug',
	            'terms' => $milestone_cat
	        )
	     ),
	    );
	  }
	 $query_milestone = new WP_Query( $args_mile );
	  	while ( $query_milestone->have_posts() ) :
      	$query_milestone->the_post();
     	$feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) );
     	$term_list = wp_get_post_terms(get_the_ID(), 'cfcategory_type', array("fields" => "all"));
		$term_slug = $term_list[0]->slug;
		?>

      <div class="cd-timeline-block <?php echo $term_slug;?>">
        <div class="cd-timeline-img cd-picture">
        </div> <!-- cd-timeline-img -->

        <div class="cd-timeline-content">
            <a href="#" class="milestone-blk">
                <div class="mil-content">
                    <span class="mil-date"><?php echo get_the_date('F d, Y');?></span>
                    <span class="mil-title"><?php the_title();?></span>
                    <?php the_content();?>
                </div>
                <img src="<?php echo $feature_img;?>" alt="<?php the_title();?>">
            </a>
        </div> <!-- cd-timeline-content -->
    </div> <!-- cd-timeline-block -->

<?php
endwhile;
wp_reset_postdata();
die();
}