<!-- ──
── ──────────────────────────────────────────────────────────
──   ::::::Copyright : :  :   :    :     :        :   :
── ──────────────────────────────────────────────────────────
── -->

<div class="copyright-block">
    <div class="container">
        <div class="row">
            <div class="col-6">
            <?php $copyright = get_theme_mod( 'footer_copyright_setting' );?>
            <p><?php echo $copyright;?></p>
        </div>

         <div class="col-6 d-flex justify-content-end align-items-center">
            <?php cf_social_icons_output(); ?>
        </div>
        </div>
    </div>
</div>