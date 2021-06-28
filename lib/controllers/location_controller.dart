import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationController extends GetxController {
  var cityName = ''.obs;
  var isLoading = true.obs;
  var lat = 0.0.obs;
  var lon = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  Future<Position> getCurrentLocation() async {
    var currentLocation;
    try {
      isLoading(true);
      currentLocation = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lat(currentLocation.latitude);
      lon(currentLocation.longitude);
      extractCityName(currentLocation.latitude, currentLocation.longitude);
    } catch (err) {
      currentLocation = null;
    } finally {
      isLoading(false);
    }

    return currentLocation;
  }

  void extractCityName(lat, lon) {
    placemarkFromCoordinates(lat, lon)
        .then((result) => cityName(result[0].postalCode));
  }
}
