<?php
/* Project loadmore */
add_action( 'wp_ajax_project_load_more', 'project_load_more' );
add_action( 'wp_ajax_nopriv_project_load_more', 'project_load_more' );
function project_load_more(){

	$project_area = $_POST['project_area'];
	$project_cat = $_POST['project_cat'];

	/* Sort by value and condition*/
	$project_sort_by = $_POST['project_sort_by'];
	if( $project_sort_by == 'recent' ){
        $orderby = 'menu_order';
        $order = 'asc';
    }
    elseif ( $project_sort_by == 'a_to_z' ) {
        $orderby = 'title';
        $order = 'asc';
    }
    elseif ( $project_sort_by == 'z_to_a' ) {
        $orderby = 'title';
        $order = 'desc';
    }
    elseif ( $project_sort_by == 'date_asc' ) {
        $orderby = 'date';
        $order = 'asc';
    }
    elseif ( $project_sort_by == 'date_desc' ) {
        $orderby = 'date';
        $order = 'desc';
    }else{
    	  $orderby = 'menu_order';
        $order = 'asc';
    }

	/*Collection of post id to exclude after loadmore*/
	$exclude_ids = $_POST['postids'];

	if( $project_area && $project_cat ){
	$args = array(
            'post_type'=>'project',
            'orderby'  => $orderby,
            'order' => $order,
            'posts_per_page' => 9,
            'post__not_in' =>$exclude_ids,
            'tax_query' => array(
                array(
                    'taxonomy' => 'cfproject_type',
                    'field' => 'slug',
                    'terms' => $project_cat
                )
             ),
            'meta_query'      => array(
                array(
                    'key' => 'practice_area',
                    'value' => $project_area,
                    'compare' => '=='
                    )
                )
        );
	}
	elseif( $project_area ){
	$args = array(
            'post_type'=>'project',
            'orderby'  => $orderby,
            'order' => $order,
            'posts_per_page' => 9,
            'post__not_in' =>$exclude_ids,
            'meta_query'      => array(
                array(
                    'key' => 'practice_area',
                    'value' => $project_area,
                    'compare' => '=='
                    )
                )
        );

	}elseif( $project_cat ){
	$args = array(
            'post_type'=>'project',
            'orderby'  => $orderby,
            'order' => $order,
            'posts_per_page' => 9,
            'post__not_in' =>$exclude_ids,
            'tax_query' => array(
                array(
                    'taxonomy' => 'cfproject_type',
                    'field' => 'slug',
                    'terms' => $project_cat
                )
             )
        );
	}
	else{
	$args = array(
          'post_type'=>'project',
          'orderby'  => $orderby,
          'order' => $order,
          'posts_per_page' => 9,
          'post__not_in' =>$exclude_ids
        );
	     }
      $query_projects_inner_lm = new WP_Query( $args );
      //var_dump($query_projects_inner);
      while ( $query_projects_inner_lm->have_posts() ) :
      $query_projects_inner_lm->the_post();
      $featured_image_lm = get_field( 'projects_featured_image' );
      ?>
      <article class="project-grid" id="project-grid-wrapper" data-id="<?php echo get_the_ID(); ?>">
          <div class="work-block" onclick="">
              <img src="<?php echo $featured_image_lm['project_square_image']['url'];?>" alt="<?php echo $featured_image_lm['project_square_image']['alt'];?>" class=" small-img img-fluid work-image">
              <img src="<?php echo $featured_image_lm['project_rectangle_image']['url'];?>" alt="<?php echo $featured_image_lm['project_square_image']['alt'];?>" class=" big-img img-fluid work-image">
              <div class="work-middle">
                  <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
                  <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
              </div>
          </div>
      </article>
    <?php
  endwhile;
  die();
}