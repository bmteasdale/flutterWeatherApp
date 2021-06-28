import 'package:get/state_manager.dart';
import 'package:weatherapp/controllers/settings_controller.dart';
import 'package:weatherapp/models/weather_model.dart';
import 'package:weatherapp/services/remote_services.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  var isLoading = true.obs;
  var weatherData = Welcome().obs;
  var hasAlerts = false.obs;

  final SettingsController settingsController = Get.put(SettingsController());

  @override
  void onInit() {
    super.onInit();
    var units = settingsController.getSelectedUnits();
    fetchWeatherData(units: units);
  }

  void fetchWeatherData({units = "Metric"}) async {
    try {
      isLoading(true);
      var weather = await RemoteServices.fetchWeatherData(units);
      if (weather != null) {
        weatherData.value = weather;
        if (weatherData.value.alerts != null) {
          hasAlerts(true);
        }
      }
    } finally {
      isLoading(false);
    }
  }

  String convertTimestamp(timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('hh:mm a').format(date);
  }

  String convertDate(timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('MM-d').format(date);
  }

  String descriptionToProperCase(String description) {
    String desc = '';
    List<String> splitDescription = description.split(" ");
    splitDescription.forEach((element) {
      desc = desc + element[0].toUpperCase() + element.substring(1) + ' ';
    });
    return desc;
  }
}
