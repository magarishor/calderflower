<?php
/**
 * The template for displaying the footer
 *
 * Contains the closing of the #content div and all content after.
 *
 * @link https://developer.wordpress.org/themes/basics/template-files/#template-partials
 *
 * @package calderflower
 */

?>

</div> <!-- end tag of site wrapper -->

<?php wp_footer();?>
<script>
    /*function dpToggleMenu(x) {
        x.classList.toggle("change");
        document.getElementById("site-navigation").classList.toggle("shift-right");
        document.getElementById("site-wrapper").classList.toggle("shift-right");

        // text toggle
        var x = document.getElementById("menu-text");
        if (x.innerHTML === "Menu") {
            x.innerHTML = "Close";
        } else {
            x.innerHTML = "Menu";
        }
    }
*/


jQuery(document).ready(function($){
// Home Banner Slider
$('.slider-for').slick({
    slidesToShow: 1,
    arrows: false,
    fade: false,
    asNavFor: '.slider-nav'
});
$('.slider-nav').slick({
    slidesToShow: 1,
    asNavFor: '.slider-for',
    dots: true,
    arrows: false,
    focusOnSelect: true,
    fade: true
});
});
</script>

</body>
</html>

