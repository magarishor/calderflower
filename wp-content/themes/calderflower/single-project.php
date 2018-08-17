<?php
get_header();
?>
<div class="project-single-banner" style="background:url(<?php echo get_stylesheet_directory_uri();?>/assets/img/project-single-banner.jpg)">
    <a href="#"> <span><</span>Back to Projects</a>
</div>

<div class="container">
    <div class="row">
        <div class="single-top-blk">
            <h1> <span>Bupa </span>  Baulkham Hills Aged Care </h1>
            <div class="single-top-btn">
                <a href="javascript:void();" class="site-btn btn-green">Architecture</a>
                <a href="javascript:void();" class="site-btn btn-green">Aged Care</a>
            </div>

            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur et amet. </p>
            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque.</p>
            
            <div class="counts">
                <ul>
                <li> <img src="<?php echo get_stylesheet_directory_uri();?>/assets/img/residents.svg" alt="">120 residents </li>
                <li> <img src="<?php echo get_stylesheet_directory_uri();?>/assets/img/area.svg" alt="">980m<sup>2</sup> </li>
                <li> <img src="<?php echo get_stylesheet_directory_uri();?>/assets/img/clock.svg" alt="">Completed 2012 </li>
                </ul>
            </div>
        </div>

        <div class="row project-grids">
            <div class="project-grid">
                <a class="grouped_elements" rel="group1" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg">
                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg" alt="small img" class="img-fluid work-image"> 
                </a>                
            </div>
            <div class="project-grid">
                <a class="grouped_elements" rel="group1" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg">
                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large img" class="img-fluid work-image"> 
                </a>                
            </div>
            <div class="project-grid">
                <a class="grouped_elements" rel="group1" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg">
                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg" alt="small img" class="img-fluid work-image"> 
                </a>                
            </div>
            <div class="project-grid">
                <a class="grouped_elements" rel="group1" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg">
                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large img" class="img-fluid work-image"> 
                </a>                
            </div>
            <div class="project-grid">
                <a class="grouped_elements" rel="group1" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg">
                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-small.jpg" alt="small img" class="img-fluid work-image"> 
                </a>                
            </div>
            <div class="project-grid">
                <a class="grouped_elements" rel="group1" href="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg">
                    <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/filter-img-large.jpg" alt="large img" class="img-fluid work-image"> 
                </a>                
            </div>
           

           
        </div>

    </div>
</div>

 <?php
        get_template_part( 'template-parts/home/content', 'letstalk' );?>

<?php
        get_template_part( 'template-parts/home/content', 'copyright' );?>


<?php
get_footer();
