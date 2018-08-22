<?php
/*
Template Name: Milestones
*/
 get_header();
?>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Milestone  Wrap : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="container project-banner" id="milestone-banner">
        <div class="row no-gutters">
            <div class="col-lg-4 projects-bnr-left">
                <h1>Milestones</h1>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                <p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. </p>
                </div>
            <div class="col-lg-8">
                <img class="img-fluid" src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/milestone-banner.jpg" alt="Projects">
            </div>
        </div>
    </div>

    <!-- ──
    ── ──────────────────────────────────────────────────────────
    ──   ::::::Milestone timeline : :  :   :    :     :        :   :
    ── ──────────────────────────────────────────────────────────
    ── -->
    <div class="container milestone-timeline">
        <div class="mil-filter">
                <select id="project-area" class="selectric sel-white" tabindex="0">
                    <option value="">Filter milestones by category</option>
                    <option value="architecture" class="case-studies">case studies</option>
                    <option value="interiors"  class="awards">awards & Achievements</option>
                    <option value="interiors"  class="cf-updates">cf updates</option>
                    <option value="interiors"  class="articles">articles</option>
                </select>
        </div>
    
        <section id="cd-timeline" class="cd-container cssanimations">
            <div class="cd-timeline-block case-studies">
                <div class="cd-timeline-img cd-picture">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">January 20, 2016</span>
                            <span class="mil-title">Ghana Hospital opens for business</span>
                            <p>The new rural hospital in Ghana desigend by Calder Flower has opened it's doors to the first patients. Construction will continue on the next stages but the local community are already on board with their new health facility. </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
    
            <div class="cd-timeline-block awards-ach">
                <div class="cd-timeline-img cd-movie">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">August 17, 2015</span>
                            <span class="mil-title">Calder Flower Architects Wins UDIA Excellence Award and Commendation</span>
                            <p>CFA received two awards at the 2015 UDIA NSW Awards for Excellence Gala Dinner.  </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
            
            <div class="cd-timeline-block cf-updates">
                <div class="cd-timeline-img cd-movie">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">August 17, 2015</span>
                            <span class="mil-title">Calder Flower Architects Wins UDIA Excellence Award and Commendation</span>
                            <p>CFA received two awards at the 2015 UDIA NSW Awards for Excellence Gala Dinner.  </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
            
            <div class="cd-timeline-block cf-updates">
                <div class="cd-timeline-img cd-movie">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">August 17, 2015</span>
                            <span class="mil-title">Calder Flower Architects Wins UDIA Excellence Award and Commendation</span>
                            <p>CFA received two awards at the 2015 UDIA NSW Awards for Excellence Gala Dinner.  </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
    
            <div class="cd-timeline-block awards-ach">
                <div class="cd-timeline-img cd-movie">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">August 17, 2015</span>
                            <span class="mil-title">Calder Flower Architects Wins UDIA Excellence Award and Commendation</span>
                            <p>CFA received two awards at the 2015 UDIA NSW Awards for Excellence Gala Dinner.  </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
    
            <div class="cd-timeline-block mil-articles">
                <div class="cd-timeline-img cd-movie">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">August 17, 2015</span>
                            <span class="mil-title">Calder Flower Architects Wins UDIA Excellence Award and Commendation</span>
                            <p>CFA received two awards at the 2015 UDIA NSW Awards for Excellence Gala Dinner.  </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
            
            <div class="cd-timeline-block mil-articles">
                <div class="cd-timeline-img cd-movie">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">August 17, 2015</span>
                            <span class="mil-title">Calder Flower Architects Wins UDIA Excellence Award and Commendation</span>
                            <p>CFA received two awards at the 2015 UDIA NSW Awards for Excellence Gala Dinner.  </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
    
            <div class="cd-timeline-block case-studies">
                <div class="cd-timeline-img cd-picture">
                </div> <!-- cd-timeline-img -->
    
                <div class="cd-timeline-content">
                    <a href="#" class="milestone-blk">
                        <div class="mil-content">
                            <span class="mil-date">January 20, 2016</span>
                            <span class="mil-title">Ghana Hospital opens for business</span>
                            <p>The new rural hospital in Ghana desigend by Calder Flower has opened it's doors to the first patients. Construction will continue on the next stages but the local community are already on board with their new health facility. </p>
                        </div>
                        <img src="<?php echo get_stylesheet_directory_uri(); ?>/assets/img/mil-img.jpg" alt="mil first">
                    </a>
                </div> <!-- cd-timeline-content -->
            </div> <!-- cd-timeline-block -->
            
        </section>
    </div>

 <?php
        //get_template_part( 'template-parts/home/content', 'letstalk' );?>

<?php
       // get_template_part( 'template-parts/home/content', 'copyright' );?>

<?php 
        get_footer(); ?>



