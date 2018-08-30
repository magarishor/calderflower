<!-- ──
── ──────────────────────────────────────────────────────────
──   ::::::Form Map : :  :   :    :     :        :   :
── ──────────────────────────────────────────────────────────
── -->
<div class="form-map">
	<?php $letstalk = get_field('cf_home_lets_talk' , '9' );?>
    <?php if(is_front_page()){?>
    <span class="heading-title"><?php echo $letstalk['cf_home_lets_talk_description'];?></span>
    <?php }?>
    <div class="btn-wrap-center">
         <?php if(is_front_page()){?>
        <a href="#" class="site-btn btn-green"><?php echo $letstalk['cf_home_lets_talk_title'];?></a>
        <?php }?>
    </div>

    <div class="container">
        <div class="row no-gutters">

            <!-- Form -->
            <div class="col-lg-6">
                <div class="form-wrap">
                   <?php echo $letstalk['cf_home_leave_us_an_enquiry_form'];?>
                </div>
            </div>

           <!-- map -->
            <div class="col-lg-6">
                <div id="map" style=" height: 500px; width: 100%;"></div>
            </div>

        </div>
    </div>
</div>
