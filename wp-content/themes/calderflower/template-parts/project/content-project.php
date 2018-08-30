   <?php
   $feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) ); ?>
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

  <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Projects Filter : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->

    <?php
        $field_name = 'field_5b6d067fbb611';
        $field = get_field_object( $field_name );
        ?>
      <div class="project-filter">
      <div class="container">
        <div class="row filter-row desktop-pr-filter">
            <div class="col-lg-8 filter-by">
                <span class="filter-label">Filter By</span>
                <select id="project-area" class="selectric sel-green">
                    <option value="">Practice Area</option>
                   <?php foreach( $field['choices'] as $k => $v ){
                    echo '<option value="' . $k . '">' . $v . '</option>';
                    } ?>
                </select>

                <select id="project-category" class="selectric sel-green">
                    <option value="">Category</option>
                    <?php
                       $args = array(
                                   'taxonomy' => 'cfproject_type',
                                   'orderby' => 'name',
                                   'order'   => 'ASC'
                               );

                       $cats = get_categories($args);
                        foreach( $cats as $cat ) {
                        ?>
                        <option value="<?php echo $cat->slug; ?>"><?php echo $cat->name; ?></option>
                   <?php }?>
                </select>
            </div>
            <div class="col-lg-4">
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

                <div id="project-area" class="sel-green radio-block">
                  <p class="radio-block-title">Practice area:</p>
                  <?php foreach( $field['choices'] as $k => $v ){?>
                      <label class=""><?php echo $v; ?>
                        <input type="radio" name="radio" value="<?php echo $k; ?>">
                        <span class="radiobtn"></span>
                      </label>
                    <?php } ?>
                </div>

                <div id="category-area" class="sel-green radio-block">
                  <p class="radio-block-title">Category :</p>
                  <?php
                   foreach( $cats as $cat ) {
                    ?>
                  <label class=""><?php echo $cat->name; ?>
                    <input type="radio" name="radio1" value="<?php echo $cat->slug; ?>">
                    <span class="radiobtn"></span>
                  </label>
                  <?php }?>
                </div>

                <div id="category-area" class="sel-green radio-block radio-block-orange">
                  <p class="radio-block-title">Sort By:</p>
                  <label class="">most recent
                    <input type="radio" name="radio2" value="recent">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">ALPHABETICAL ORDER (A-Z)
                    <input type="radio"  name="radio2" value="a_to_z">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">ALPHABETICAL ORDER (Z-A)
                    <input type="radio"  name="radio2" value="z_to_a">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">DATE (NEW-OLD)
                    <input type="radio"  name="radio2" value="date_desc">
                    <span class="radiobtn"></span>
                  </label>
                  <label class="">DATE (OLD-NEW)
                    <input type="radio"  name="radio2" value="date_asc">
                    <span class="radiobtn"></span>
                  </label>
                </div>
            </div>
        </div>

        <div class="row project-grids" id="project-grids">
            <?php
              $total_post_count = wp_count_posts( 'project' );
              $total_post = $total_post_count->publish;

              $args = array(
                  'post_type'=>'project',
                  'orderby'  => 'menu_order',
                  'order' => 'ASC',
                  'posts_per_page' => 9
              );
              $query_projects_inner = new WP_Query( $args );
              //var_dump($query_projects_inner);
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
        </div>
        <div class="btn-wrap-center">
            <a href="#" class="site-btn btn-orange" id="loadmore">Load More </a>
            <input type="hidden" id="total_post" value="<?php echo $total_post;?>">
        </div>
    </div>
    </div>