<!-- ──
  ── ──────────────────────────────────────────────────────────
  ──   ::::::Projects Sldier : :  :   :    :     :        :   :
  ── ──────────────────────────────────────────────────────────
  ── -->
  <?php $feature_img = wp_get_attachment_url( get_post_thumbnail_id(get_the_ID()) );?>
  <div class="container project-banner" id="about-banner">
      <div class="row no-gutters">
          <div class="col-lg-4 projects-bnr-left">
              <h1><?php the_title();?></h1>
              <?php the_content();?>
              <a href="<?php echo esc_url( home_url( '/meet-the-team' ) ); ?>" class="site-btn btn-orange">Meet the team</a>
          </div>
          <div class="col-lg-8">
             <div class="right-banner">
                 <div class="right-top-sldr">
                     <img src="<?php echo $feature_img;?>" alt="<?php the_title();?>">
                 </div>
                 <div class="right-btm-sldr">
                  <a href="http://localhost/calderflower/projects/" class="bnr-page-blk  bnr-aged">
                      <img src="http://localhost/calderflower/wp-content/themes/calderflower/assets/img/aged.svg" alt="">
                     Aged Care & <br> Retirement
                  </a>
                  <a href="http://localhost/calderflower/meet-the-team/" class="bnr-page-blk bnr-community">
                    <img src="http://localhost/calderflower/wp-content/themes/calderflower/assets/img/community.svg" alt="">
                      Community <br> Living Spaces </a>
                  <a href="http://localhost/calderflower/blog/" class="bnr-page-blk bnr-housing">
                   <img src="http://localhost/calderflower/wp-content/themes/calderflower/assets/img/housing.svg" alt="">
                    Housing & <br> Apartments </a>
                  <a href="http://localhost/calderflower/blog/" class="bnr-page-blk bnr-master">
                  <img src="http://localhost/calderflower/wp-content/themes/calderflower/assets/img/master-planning.svg" alt="">
                    Master <br> Planning </a>
              </div>
             </div>
          </div>
      </div>
  </div>

  <!-- ──
  ── ──────────────────────────────────────────────────────────
  ──   ::::::Two Column arc+interior : :  :   :    :     :        :   :
  ── ──────────────────────────────────────────────────────────
  ── -->
  <div class="arc-int-blk">
      <div class="container">
          <div class="row">
              <div class="col-lg-6 text-center arc-left">
                  <img class="svg-team" src="http://localhost/calderflower/wp-content/themes/calderflower/assets/img/architecture-team.svg" alt="">
                  <?php $team_blk = get_field( 'cf_about_info_block' );?>
                  <h2>Architecture team</h2>
                  <?php echo $team_blk['cf_architecture_block'];?>

              </div>
              <div class="col-lg-6 text-center int-right">
                  <img class="svg-team" src="http://localhost/calderflower/wp-content/themes/calderflower/assets/img/interiors-team.svg" alt="">
                  <h2>Interiors team</h2>
                  <?php echo $team_blk['cf_interiors_block'];?>
              </div>
          </div>
      </div>
  </div>