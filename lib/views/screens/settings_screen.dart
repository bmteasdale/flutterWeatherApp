import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/weather_controller.dart';
import 'package:weatherapp/controllers/settings_controller.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

enum Units { Standard, Imperial, Metric }
Map<String, Units> stringToUnits = ({
  "Standard": Units.Standard,
  "Imperial": Units.Imperial,
  "Metric": Units.Metric
});

Map<Units, String> unitsToString = ({
  Units.Standard: "Standard",
  Units.Imperial: "Imperial",
  Units.Metric: "Metric"
});
final SettingsController settingsController = Get.find();
final WeatherController weatherController = Get.find();

void onBackTap() {
  weatherController.fetchWeatherData(
      units: settingsController.selectedUnits.value);
  Get.back();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).accentColor == Colors.black
              ? Colors.grey[300]
              : Colors.white,
          leading: IconButton(
            onPressed: () => {onBackTap()},
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Text('Settings'),
        ),
        body: Obx(
          () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.0),
                  Text(
                    'Units',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    title: Text("Standard (Kelvin)"),
                    leading: Radio<Units>(
                      value: Units.Standard,
                      groupValue: stringToUnits[
                                  settingsController.selectedUnits.value] ==
                              null
                          ? Units.Metric
                          : stringToUnits[
                              settingsController.selectedUnits.value],
                      onChanged: (Units value) {
                        settingsController
                            .setSelectedUnits(unitsToString[value]);
                      },
                      activeColor: Colors.blueGrey,
                    ),
                  ),
                  ListTile(
                    title: Text("Imperial (Fahrenheit)"),
                    leading: Radio<Units>(
                      value: Units.Imperial,
                      groupValue: stringToUnits[
                                  settingsController.selectedUnits.value] ==
                              null
                          ? Units.Metric
                          : stringToUnits[
                              settingsController.selectedUnits.value],
                      onChanged: (Units value) {
                        settingsController
                            .setSelectedUnits(unitsToString[value]);
                      },
                      activeColor: Colors.blueGrey,
                    ),
                  ),
                  ListTile(
                    title: Text("Metric (Celsius)"),
                    leading: Radio<Units>(
                      value: Units.Metric,
                      groupValue: stringToUnits[
                                  settingsController.selectedUnits.value] ==
                              null
                          ? Units.Metric
                          : stringToUnits[
                              settingsController.selectedUnits.value],
                      onChanged: (Units value) {
                        settingsController
                            .setSelectedUnits(unitsToString[value]);
                      },
                      activeColor: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
