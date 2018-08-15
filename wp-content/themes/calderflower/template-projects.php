<?php
/*
Template Name: Projects
*/
 get_header();
?>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Projects Sldier : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="container project-banner">
        <div class="row no-gutters">
            <div class="col-lg-4 projects-bnr-left">
                <h1>Projects</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p> 
                  
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure
                    dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
            </div>
            <div class="col-lg-8">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/project-banner.jpg" alt="">
            </div>
        </div>    
    </div>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Projects Filter : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="project-filter">
    <div class="container">
        <div class="row filter-row">
            <div class="col-lg-7 filter-by">
                <span class="filter-label">Filter By</span>
                <select  id="project-area" class="selectric sel-green">
                    <option value="">Practice area</option>
                    <option value="apple">Architecture</option>
                    <option value="banana">Interiors</option>
                    <option value="orange">Orange</option>
                </select>

                <select  id="" class="selectric sel-green">
                    <option value="">Category</option>
                    <option value="orange">community living</option>
                    <option value="apple">Aged care</option>
                    <option value="banana">housing</option>
                    <option value="apple">Aged care</option>
                    <option value="orange">community living</option>
                </select>

            </div>
            <div class="col-lg-5">
                 <select  id="" class="selectric sel-orange">
                    <option value="">most recent</option>
                    <option value="orange">ALPHABETICAL ORDER (A-Z)</option>
                    <option value="apple">ALPHABETICAL ORDER (Z-A)</option>
                    <option value="banana">DATE (NEW-OLD)</option>
                    <option value="apple">DATE (OLD-NEW)</option>
                </select>
            </div>
        </div>

        <div class="row project-grids">
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg" alt="small jpg">
            </div>
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large jpg">
            </div>
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large jpg">
            </div>
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large jpg">
            </div>
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large jpg">
            </div>
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large jpg">
            </div>
            <div class="project-grid">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large jpg">
            </div>
        </div>
    </div>
    </div>



 <?php
        get_template_part( 'template-parts/home/content', 'letstalk' );?>

<?php
        get_template_part( 'template-parts/home/content', 'copyright' );?>

<?php 
        get_footer(); ?>



