<!-- ──
── ──────────────────────────────────────────────────────────
──   ::::::Form Map : :  :   :    :     :        :   :
── ──────────────────────────────────────────────────────────
── -->
<div class="form-map">
	<?php $letstalk = get_field('cf_home_lets_talk');?>
    <span class="heading-title"><?php echo $letstalk['cf_home_lets_talk_description'];?></span>
    <div class="btn-wrap-center">
        <a href="#" class="site-btn btn-green"><?php echo $letstalk['cf_home_lets_talk_title'];?></a>
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
