<!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Architecture Team : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <?php
    $count_term = 0;
    $terms = get_terms(array(
        'taxonomy' => 'cfteam_type',
        'hide_empty' => true,
        'orderby' => 'ID',
        'order' => 'DESC',
    ));
    foreach( $terms as $term ) {
        if( $count_term == 1 ){
           echo '<div id="interiors-block">';
        }
    ?>

    <div class="container architecture-block">
        <div class="row no-gutters">
            <div class="col-lg-12 text-center">
                <img class="svg-team" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/<?php echo $term->slug; ?>-team.svg">
                <h2><?php echo $term->name; ?> Team</h2>
            </div>

            <?php
                $args = array(
                    'post_type' => 'team',
                    'post_status' => 'publish',
                    'posts_per_page' => - 1,
                    'tax_query' => array(
                        array(
                            'taxonomy' => 'cfteam_type',
                            'field' => 'term_id',
                            'terms' => $term->term_id
                        )
                    )
                );
                $team_query = new WP_Query($args);
                $count = 0;
                while ($team_query->have_posts()):
                    $team_query->the_post();
                    $team_img_url = get_the_post_thumbnail_url(get_the_ID() , 'full');
                    ?>

                <div class="team-block col-lg-2 col-6">
                    <a href="#" data-toggle="modal" data-target="#<?php echo $term->slug; ?>-<?php echo $count; ?>">
                         <img src="<?php echo $team_img_url;?>" alt="team first">
                          <span class="team-name"><?php the_title();?></span>
                          <span class="team-designation"><?php echo get_field('team_designation');?></span>
                    </a>
                    <div class="modal fade" id="<?php echo $term->slug; ?>-<?php echo $count; ?>" tabindex="-1" role="dialog" aria-labelledby="int-team-1Title" aria-hidden="true">
                        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
                            <div class="modal-content">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                                </button>
                            <div class="modal-body">
                                <div class="team-wrap">
                                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/plain.jpg" alt="team first">
                                    <div class="team-desc">
                                        <span class="team-name"><?php the_title();?></span>
                                        <span class="team-designation"><?php echo get_field('team_designation');?></span>
                                        <?php the_content();?>
                                    </div>
                                </div>
                            </div>

                            </div>
                        </div>
                    </div>
                </div>
            <?php
                $count++;
                endwhile;
                wp_reset_postdata();
                ?>
            </div>
        </div>

<?php
        if( $count_term == 1 ){
           echo '</div>';
        }

$count_term++; } ?>