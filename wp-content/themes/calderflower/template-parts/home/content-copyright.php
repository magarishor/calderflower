<!-- ──
── ──────────────────────────────────────────────────────────
──   ::::::Copyright : :  :   :    :     :        :   :
── ──────────────────────────────────────────────────────────
── -->

<div class="copyright-block">
        <div class="container">
            <div class="row">
                <div class="col-lg-7">
                <?php $copyright = get_theme_mod( 'footer_copyright_setting' );?>
                <p><?php echo $copyright;?></p>
                <?php menu_fetch('Footer Menu','footer-links'); ?>
            </div>

             <div class="col-lg-5 d-flex justify-content-end align-items-center">
                <?php cf_social_icons_output(); ?>
            </div>
            </div>
        </div>
    </div>