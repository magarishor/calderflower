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

 <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDhgZEZLKCLOBawajpWrUqw6exsSJOeDI8&callback=initMap"></script>

    <script>
      var map;
      var addresses = [
      'Calder Flower Architects Pty Ltd'];
      // Info Window Content
      var infoWindowContent = [
      '<div class="info_content">Calder Flower Architects Pty Ltd</div>'];

      function initMap() {
        var bounds = new google.maps.LatLngBounds();
        geocoder = new google.maps.Geocoder();

        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 13
        });

        if (geocoder) {

              // Display multiple markers on a map
              var infoWindow = new google.maps.InfoWindow();
              var counter = 0;

              for (var x = 0; x < addresses.length; x++) {

                geocoder.geocode({
                  'address': addresses[x]
                }, function (results, status) {
                  if (status == google.maps.GeocoderStatus.OK) {
                    if (status != google.maps.GeocoderStatus.ZERO_RESULTS) {

                      var iwContent = infoWindowContent[counter];

                      var marker = new google.maps.Marker({
                        position: results[0].geometry.location,
                        map: map,
                        title: addresses[counter]
                      });

                      google.maps.event.addListener(marker, 'click', function () {

                        infoWindow.setContent(iwContent);
                        infoWindow.open(map, marker);
                      });

                      counter++;

                              // Automatically center the map fitting all markers on the screen
                              bounds.extend(results[0].geometry.location);
                              // map.fitBounds(bounds);

                              map.fitBounds(bounds);
                              var zoom = map.getZoom();
                              map.setZoom(zoom > 6 ? 14 : zoom);
                            }
                          }
                        });
              }
            }
          }
        </script>

</body>
</html>

