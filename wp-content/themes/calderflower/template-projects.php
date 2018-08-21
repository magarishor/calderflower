<?php
/* Template Name: Projects */

 get_header();
 while( have_posts() ) :
    the_post();
    $feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) );
    ?>
    <div class="container project-banner">
        <div class="row no-gutters">
            <div class="col-lg-4 projects-bnr-left">
                <h1><?php the_title(); ?></h1>
                <?php the_content();?>
            </div>
            <div class="col-lg-8">
                <img class="img-fluid" src="<?php echo $feature_img;?>" alt="<?php the_title();?>">
            </div>
        </div>
    </div>
<?php endwhile; ?>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Projects Filter : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->

    <?php
        $field_name = 'field_5b6d067fbb611';
        $field = get_field_object($field_name);
        ?>
    <div class="project-filter">
    <div class="container">
        <div class="row filter-row desktop-pr-filter">
            <div class="col-lg-7 filter-by">
                <span class="filter-label">Filter By</span>
                <select  id="project-area" class="selectric sel-green">
                    <option value="">Project Area</option>
                   <?php foreach( $field['choices'] as $k => $v ){
                    echo '<option value="' . $k . '">' . $v . '</option>';
                    } ?>
                </select>

                <select  id="project-category" class="selectric sel-green">
                    <option value="">Category</option>
                    <?php
                       $args = array(
                                   'taxonomy' => 'cfproject_type',
                                   'orderby' => 'name',
                                   'order'   => 'ASC'
                               );

                       $cats = get_categories($args);
                       foreach($cats as $cat) {
                        ?>
                        <option value="<?php echo $cat->slug; ?>"><?php echo $cat->name; ?></option>
                   <?php }?>
                </select>

            </div>
            <div class="col-lg-5">
                 <select  id="sort-by" class="selectric sel-orange">
                    <option value="recent">most recent</option>
                    <option value="a_to_z">ALPHABETICAL ORDER (A-Z)</option>
                    <option value="z_to_a">ALPHABETICAL ORDER (Z-A)</option>
                    <option value="date_desc">DATE (NEW-OLD)</option>
                    <option value="date_asc">DATE (OLD-NEW)</option>
                </select>
            </div>
        </div>

        <div class="row filter-row mobile-pr-filter">
            <div class="toggle-filter">
                Show filter Options
            </div>

            <div class="col-12 filter-by">

                <div  id="project-area" class="sel-green radio-block">
                  <p class="radio-block-title">Practice area:</p>
                  <label class="">Architecture
                    <input type="radio" name="radio" value="one">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">Interiors
                    <input type="radio"  name="radio" value="onse">
                    <span class="radiobtn"></span>
                  </label>
                </div>

                <div  id="category-area" class="sel-green radio-block">
                  <p class="radio-block-title">Practice area:</p>
                  <label class="">Aged Care
                    <input type="radio" name="radio1">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">Housing
                    <input type="radio"  name="radio1">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">Master Planning
                    <input type="radio"  name="radio1">
                    <span class="radiobtn"></span>
                  </label>
                </div>

                <div  id="category-area" class="sel-green radio-block radio-block-orange">
                  <p class="radio-block-title">Practice area:</p>
                  <label class="">Aged Care
                    <input type="radio" name="radio1">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">Housing
                    <input type="radio"  name="radio1">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">Master Planning
                    <input type="radio"  name="radio1">
                    <span class="radiobtn"></span>
                  </label>
                </div>

            </div>

        </div>

        <div class="row project-grids" id="project-grids">
            <?php
            $args = array(
                'post_type'=>'project',
                'orderby'  => 'date',
                'order' => 'DESC',
                'posts_per_page' => -1

            );
            $query_projects_inner = new WP_Query( $args );
            //var_dump($query_projects_inner);
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
        <?php endwhile; ?>
        </div>
    </div>
    </div>




<?php
        get_template_part( 'template-parts/home/content', 'letstalk' );?>

<?php
        get_template_part( 'template-parts/home/content', 'copyright' );?>

<?php
        get_footer(); ?>



