  function initMaps() {
            google.maps.event.addDomListener(window, 'load');

            var epoint = document.getElementById('point');
            var autocomplete1 = new google.maps.places.Autocomplete(epoint, {
                loc: ['geocode'],
                // componentRestrictions: { country: 'uk' }
            });



            google.maps.event.addListener(autocomplete1, 'place_changed', function() {
                var place = autocomplete1.getPlace();
                $('#latitude').val(place.geometry['location'].lat());
                $('#longitude').val(place.geometry['location'].lng());
            });

        }





         $(document).ready(function() {
             google.load("maps", "3.exp", {
                 callback: initMaps,
                 other_params: 'key=AIzaSyC6ztB4o1ixkv8dG56QflPL81I908W49gQ&libraries=places,drawing'
             });
         })