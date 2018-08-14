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


 <script async defer src="https://maps.googleapis.com/maps/api/js?key=<?php echo get_theme_mod( 'site_map_setting' ); ?>&callback=initMap"></script>
  <?php
    $maps = get_field( 'cf_home_lets_talk', 9 );
    ?>

    <script>
    var map;
    var addresses = [
    '<?php echo $maps[ 'cf_home_maps_address' ];?>'];
    // Info Window Content
    var infoWindowContent = [
    '<div class="info_content"><?php echo $maps[ 'cf_home_maps_information' ];?></div>'];
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

