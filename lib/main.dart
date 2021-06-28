import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:weatherapp/controllers/location_controller.dart';
import 'package:weatherapp/views/screens/home_screen.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/controllers/weather_controller.dart';
import 'package:weatherapp/controllers/settings_controller.dart';

Future main() async {
  await GetStorage.init();
  await dotenv.load();
  runApp(MyWeatherApp());
}

// LinearGradient() -> #acb6e5: #86fde8
// https://uigradients.com/#Windy

class MyWeatherApp extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  final SettingsController settingsController = Get.put(SettingsController());
  final LocationController locationController = Get.put(LocationController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Weather or Not',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.white,
          accentColor: Colors.black,
          scaffoldBackgroundColor: Colors.grey[100]),
      home: HomeScreen(),
    );
  }
}
