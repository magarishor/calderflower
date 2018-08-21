<?php
get_header();
while( have_posts() ) : the_post();
$banner_image = get_field( 'projects_banner_image' );
?>
<div class="project-single-banner" style="background:url(<?php echo $banner_image['url'];?>)">
    <a href="<?php echo esc_url( home_url( '/projects' ) ); ?>"> <span><</span>Back to Projects</a>
</div>

<div class="container">
    <div class="row">
        <div class="single-top-blk">
            <h1> <span><?php echo get_field( 'projects_subtitle' );?> </span>  <?php the_title();?> </h1>
            <div class="single-top-btn">

                <?php $practice_area = get_field( 'practice_area' ); ?>
                <a href="javascript:void();" class="site-btn btn-green"><?php echo $practice_area; ?></a>
                <?php
                    $project_category = get_the_terms( get_the_id(), 'cfproject_type' );
                    //var_dump( $project_category );
                    foreach ( $project_category as $cat_name ){
                    ?>
                <a href="javascript:void();" class="site-btn btn-green"><?php echo $cat_name->name ?></a>
                <?php } ?>
            </div>

            <?php the_content();?>

            <div class="counts">
                <?php $project_info_gr = get_field( 'icon_blocks' );?>
                <ul>
                <li> <img src="<?php echo get_stylesheet_directory_uri();?>/assets/img/residents.svg" alt=""><?php echo $project_info_gr['cf_residents_info'];?> residents </li>
                <li> <img src="<?php echo get_stylesheet_directory_uri();?>/assets/img/area.svg" alt=""><?php echo $project_info_gr['cf_area_info'];?>m<sup>2</sup> </li>
                <li> <img src="<?php echo get_stylesheet_directory_uri();?>/assets/img/clock.svg" alt="">Completed <?php echo $project_info_gr['cf_completed_year_text'];?> </li>
                </ul>
            </div>
        </div>

        <div class="row project-grids">
            <?php
                $images = get_field( 'cf_projects_gallery' );
                foreach( $images as $image ):
                ?>
                <div class="project-grid">
                    <a class="grouped_elements" rel="group1" href="<?php echo $image['url']; ?>">
                        <img src="<?php echo $image['url']; ?>" alt="<?php echo $image['alt']; ?>" class="img-fluid work-image">
                    </a>
                </div>
            <?php endforeach;?>


        </div>

    </div>
</div>

 <?php
        get_template_part( 'template-parts/home/content', 'letstalk' );?>

<?php
        get_template_part( 'template-parts/home/content', 'copyright' );?>


<?php
endwhile;
get_footer();
