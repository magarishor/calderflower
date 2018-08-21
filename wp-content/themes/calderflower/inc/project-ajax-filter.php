<?php
add_action( 'wp_ajax_project_area_filter', 'project_area_filter' );
add_action( 'wp_ajax_nopriv_project_area_filter', 'project_area_filter' );

function project_area_filter(){

	$project_area = $_POST['project_area'];
    $project_cat = $_POST['project_cat'];
            if( $project_area && $project_cat ){
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'date',
                'order' => 'DESC',
                'posts_per_page' => '6',
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

        }else{
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'date',
                'order' => 'DESC',
                'posts_per_page' => -1,
                'meta_query'      => array(
                    array(
                        'key' => 'practice_area',
                        'value' => $project_area,
                        'compare' => '=='
                        )
                    )
            );

        }
            $query_projects_inner = new WP_Query( $args );
            while ( $query_projects_inner->have_posts() ) :
            $query_projects_inner->the_post();
            $img = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'full' );
            ?>
            <div class="project-grid" id="project-grid-wrapper">
                <div class="work-block" onclick="">
                    <img src="<?php echo $img[0];?>" alt="small img" class="img-fluid work-image">
                    <div class="work-middle">
                        <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
                        <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
                    </div>
                </div>
            </div>
        <?php endwhile;
        die();
}


add_action( 'wp_ajax_project_cat_filter', 'project_cat_filter' );
add_action( 'wp_ajax_nopriv_project_cat_filter', 'project_cat_filter' );
function project_cat_filter(){

    $project_area = $_POST['project_area'];
    $project_cat = $_POST['project_cat'];

    if( $project_area && $project_cat ){
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'date',
                'order' => 'DESC',
                'posts_per_page' => '6',
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

        }else{
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'date',
                'order' => 'DESC',
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
            $query_projects_inner = new WP_Query( $args );
            while ( $query_projects_inner->have_posts() ) :
            $query_projects_inner->the_post();
            $img = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'full' );
            ?>
            <div class="project-grid" id="project-grid-wrapper">
                <div class="work-block" onclick="">
                    <img src="<?php echo $img[0];?>" alt="small img" class="img-fluid work-image">
                    <div class="work-middle">
                        <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
                        <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
                    </div>
                </div>
            </div>
        <?php endwhile;
        die();

}


add_action( 'wp_ajax_project_sort_filter', 'project_sort_filter' );
add_action( 'wp_ajax_nopriv_project_sort_filter', 'project_sort_filter' );
function project_sort_filter(){

    $project_sort_by = $_POST['project_sort_by'];
    if( $project_sort_by == 'recent' ){
        $orderby = 'date';
        $order = 'desc';
    }
    elseif ( $project_sort_by == 'a_to_z' ) {
        $orderby = 'name';
        $order = 'desc';
    }
    elseif ( $project_sort_by == 'z_to_a' ) {
        $orderby = 'name';
        $order = 'asc';
    }
    elseif ( $project_sort_by == 'date_asc' ) {
        $orderby = 'date';
        $order = 'asc';
    }
    elseif ( $project_sort_by == 'date_desc' ) {
        $orderby = 'date';
        $order = 'desc';
    }

    $args = array(
        'post_type'=>'project',
        'orderby'  => $orderby,
        'order' => $order,
        'posts_per_page' => -1,

    );
    $query_projects_inner = new WP_Query( $args );
    while ( $query_projects_inner->have_posts() ) :
    $query_projects_inner->the_post();
    $img = wp_get_attachment_image_src( get_post_thumbnail_id( get_the_ID() ), 'full' );
    ?>
    <div class="project-grid" id="project-grid-wrapper">
        <div class="work-block" onclick="">
            <img src="<?php echo $img[0];?>" alt="small img" class="img-fluid work-image">
            <div class="work-middle">
                <p> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?></p>
                <a href="<?php the_permalink();?>" class="work-btn site-btn btn-orange">View Work</a>
            </div>
        </div>
    </div>
<?php
endwhile;
die();

}