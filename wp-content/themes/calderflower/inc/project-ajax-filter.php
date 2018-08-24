<?php
/* Project Area Filter */
add_action( 'wp_ajax_project_area_filter', 'project_area_filter' );
add_action( 'wp_ajax_nopriv_project_area_filter', 'project_area_filter' );
function project_area_filter(){

	$project_area = $_POST['project_area'];
    $project_cat = $_POST['project_cat'];

    if( $project_area && $project_cat ){
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => '2',
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
            $argslm = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => -1,
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

            }elseif( $project_area ){
                $args = array(
                    'post_type'=>'project',
                    'orderby'  => 'menu_order',
                    'order' => 'ASC',
                    'posts_per_page' => 9,
                    'meta_query'      => array(
                        array(
                            'key' => 'practice_area',
                            'value' => $project_area,
                            'compare' => '=='
                            )
                        )
                );

                $argslm = array(
                    'post_type'=>'project',
                    'orderby'  => 'menu_order',
                    'order' => 'ASC',
                    'posts_per_page' => -1,
                    'meta_query'      => array(
                        array(
                            'key' => 'practice_area',
                            'value' => $project_area,
                            'compare' => '=='
                            )
                        )
                );

            }else{

            $args = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => 9,

            );
            $argslm = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => -1,

            );

            }

            $query_projects_inner = new WP_Query( $args );
            $query_projects_inner_lm = new WP_Query( $argslm );

            $proj_total_post_filter_lm = $query_projects_inner_lm->post_count;
            //echo $proj_total_post_filter_lm;
            while ( $query_projects_inner->have_posts() ) :
            $query_projects_inner->the_post();
            $featured_image = get_field( 'projects_featured_image' );
            ?>
            <article class="project-grid" id="project-grid-wrapper" data-id="<?php echo get_the_ID(); ?>">
                <div class="work-block" onclick="">
                    <img src="<?php echo $featured_image['project_square_image']['url'];?>" alt="<?php echo $featured_image['project_square_image']['alt'];?>" class=" small-img img-fluid work-image">
                    <img src="<?php echo $featured_image['project_rectangle_image']['url'];?>" alt="<?php echo $featured_image['project_square_image']['alt'];?>" class=" big-img img-fluid work-image">
                    <div class="work-middle">
                        <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
                        <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
                    </div>
                </div>
            </article>
        <?php endwhile; ?>
        <script>
            jQuery("#total_post").val(<?php echo $proj_total_post_filter_lm; ?>);
        </script>
        <?php
        die();
}

/* Project Category Filter */
add_action( 'wp_ajax_project_cat_filter', 'project_cat_filter' );
add_action( 'wp_ajax_nopriv_project_cat_filter', 'project_cat_filter' );
function project_cat_filter(){

    $project_area = $_POST['project_area'];
    $project_cat = $_POST['project_cat'];

    if( $project_area && $project_cat ){
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => 9,
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

            $argslm_cat = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => -1,
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

        }elseif( $project_cat ){
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => 9,
                'tax_query' => array(
                    array(
                        'taxonomy' => 'cfproject_type',
                        'field' => 'slug',
                        'terms' => $project_cat
                    )
                 )
            );
            $argslm_cat = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => -1,
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
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => 9,
            );
            $argslm_cat = array(
                'post_type'=>'project',
                'orderby'  => 'menu_order',
                'order' => 'ASC',
                'posts_per_page' => -1,
            );
            }
            $query_projects_inner = new WP_Query( $args );
            $query_projects_inner_lm_cat = new WP_Query( $argslm_cat );
            $proj_total_post_filter_lm_cat = $query_projects_inner_lm_cat->post_count;

            while ( $query_projects_inner->have_posts() ) :
            $query_projects_inner->the_post();
            $featured_image = get_field( 'projects_featured_image' );
            ?>
            <article class="project-grid" id="project-grid-wrapper" data-id="<?php echo get_the_ID(); ?>">
                <div class="work-block" onclick="">
                    <img src="<?php echo $featured_image['project_square_image']['url'];?>" alt="<?php echo $featured_image['project_square_image']['alt'];?>" class=" small-img img-fluid work-image">
                    <img src="<?php echo $featured_image['project_rectangle_image']['url'];?>" alt="<?php echo $featured_image['project_square_image']['alt'];?>" class=" big-img img-fluid work-image">
                    <div class="work-middle">
                        <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
                        <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
                    </div>
                </div>
            </article>
        <?php endwhile; ?>

        <script>
            jQuery("#total_post").val(<?php echo $proj_total_post_filter_lm_cat; ?>);
        </script>

       <?php die();

}

/* Project Sort filter */
add_action( 'wp_ajax_project_sort_filter', 'project_sort_filter', 10 );
add_action( 'wp_ajax_nopriv_project_sort_filter', 'project_sort_filter', 10 );
function project_sort_filter(){

    $project_sort_by = $_POST['project_sort_by'];
    if( $project_sort_by === 'recent' ){
        $orderby = 'menu_order';
        $order = 'asc';
    }
    elseif ( $project_sort_by === 'z_to_a' ) {
        $orderby = 'title';
        $order = 'desc';
    }
    elseif ( $project_sort_by === 'a_to_z' ) {
        $orderby = 'title';
        $order = 'asc';
    }
    elseif ( $project_sort_by === 'date_asc' ) {
        $orderby = 'date';
        $order = 'asc';
    }
    elseif ( $project_sort_by === 'date_desc' ) {
        $orderby = 'date';
        $order = 'desc';
    }else{
        $orderby = 'menu_order';
        $order = 'asc';
    }

    $args = array(
        'post_type'=>'project',
        'orderby'  => $orderby,
        'order' => $order,
        'posts_per_page' => 9,

    );
    $query_projects_inner = new WP_Query( $args );
    $proj_total_post_filter = $query_projects_inner->post_count;
    while ( $query_projects_inner->have_posts() ) :
    $query_projects_inner->the_post();
    $featured_image = get_field( 'projects_featured_image' );
    ?>
    <article class="project-grid" id="project-grid-wrapper" data-id="<?php echo get_the_ID(); ?>">
        <div class="work-block" onclick="">
            <img src="<?php echo $featured_image['project_square_image']['url'];?>" alt="<?php echo $featured_image['project_square_image']['alt'];?>" class=" small-img img-fluid work-image">
            <img src="<?php echo $featured_image['project_rectangle_image']['url'];?>" alt="<?php echo $featured_image['project_square_image']['alt'];?>" class=" big-img img-fluid work-image">
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