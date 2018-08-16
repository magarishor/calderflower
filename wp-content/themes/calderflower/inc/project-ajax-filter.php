<?php
add_action( 'wp_ajax_project_area_filter', 'project_area_filter' );
add_action( 'wp_ajax_nopriv_project_area_filter', 'project_area_filter' );

function project_area_filter(){

	$project_area = $_POST['project_area'];
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'date',
                'order' => 'DESC',
                'posts_per_page' => '6',
                'meta_query'      => array(
                    array(
                        'key' => 'practice_area',
                        'value' => $project_area,
                        'compare' => '=='
                        )
                    )
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
        <?php endwhile;
        die();
}