<?php
/*
Template Name: Milestones
*/
 get_header();
 while( have_posts() ) :
    the_post();
    $feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) );
    ?>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Milestone  Wrap : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="container project-banner" id="milestone-banner">
        <div class="row no-gutters">
            <div class="col-lg-4 projects-bnr-left">
                <h1><?php the_title(); ?></h1>
               	<?php the_content(); ?>
                </div>
            <div class="col-lg-8">
                <img class="img-fluid" src="<?php echo $feature_img; ?>" alt="<?php the_title();?>">
            </div>
        </div>
    </div>

	<?php
		endwhile;
		wp_reset_postdata();
		?>
    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Milestone timeline : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="container milestone-timeline">
        <div class="mil-filter">
            <select id="milestone" class="selectric sel-white" tabindex="0">
                <option value="">Filter milestones by category</option>
                <?php
                   $args = array(
                               'taxonomy' => 'cfcategory_type',
                               'orderby' => 'name',
                               'order'   => 'ASC'
                           );

                   $cats = get_categories($args);
                    foreach( $cats as $cat ) {
                    ?>
                <option value="<?php echo $cat->slug;?>" class="<?php echo $cat->slug;?>"><?php echo $cat->name;?></option>
                <?php }?>
            </select>
        </div>

        <section id="cd-timeline" class="cd-container cssanimations">
    	<?php
	          $args = array(
	              'post_type'=>'milestone',
	              'orderby'  => 'date',
	              'order' => 'ASC',
	              'posts_per_page' => -1
	          );
	          $query_milestone = new WP_Query( $args );
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
        	?>
        </section>
    </div>

 <?php
        get_template_part( 'template-parts/home/content', 'letstalk' );?>

<?php
        get_template_part( 'template-parts/home/content', 'copyright' );?>

<?php
        get_footer(); ?>



