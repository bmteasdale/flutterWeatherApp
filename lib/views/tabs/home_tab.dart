import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/location_controller.dart';
import 'package:weatherapp/controllers/settings_controller.dart';
import 'package:weatherapp/views/screens/settings_screen.dart';
import 'package:weatherapp/controllers/weather_controller.dart';
import 'package:weatherapp/views/widgets/current_weather.dart';
import 'package:weatherapp/views/widgets/moonrise_moonset.dart';
import 'package:weatherapp/views/widgets/sunrise_sunset.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final WeatherController weatherController = Get.find();
  final LocationController locationController = Get.find();
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => (weatherController.isLoading.value == true
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: Scrollbar(
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              IconButton(
                                  icon: Icon(
                                    Icons.settings,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () =>
                                      {Get.to(() => SettingsScreen())}),
                              IconButton(
                                  icon: Icon(
                                    Icons.refresh,
                                    color: Theme.of(context).accentColor,
                                  ),
                                  onPressed: () => {
                                        weatherController.fetchWeatherData(
                                            units: settingsController
                                                .getSelectedUnits())
                                      })
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(children: <Widget>[
                        Icon(
                          Icons.location_city_rounded,
                          color: Theme.of(context).accentColor,
                          size: 50.0,
                        ),
                        SizedBox(height: 20.0),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Antigonish, NS",
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontSize: 35.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                weatherController.weatherData.value.current.temp
                                    .toInt()
                                    .toString(),
                                style: TextStyle(
                                    fontSize: 80.0,
                                    color: Theme.of(context).accentColor),
                              ),
                              Text(
                                settingsController.selectedUnits.value ==
                                        "Standard"
                                    ? "K"
                                    : "°",
                                style: TextStyle(fontSize: 80.0),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        CurrentWeather()
                      ]),
                    ),
                    SunriseSunset(),
                    MoonriseMoonset()
                  ],
                ),
              ),
            )),
    );
  }
}
