import 'package:flutter/material.dart';
import 'package:weatherapp/controllers/weather_controller.dart';
import 'package:get/get.dart';

class AlertTab extends StatelessWidget {
  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    if (weatherController.hasAlerts != null) {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Text("There are no alerts for your area at this time.",
              style: TextStyle(fontSize: 15.0)),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.0),
            Text(
              "My Weather Alerts",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 40.0),
            Center(
                child: Text("There is " +
                    weatherController.weatherData.value.alerts.length
                        .toString() +
                    " weather alert(s) for your area.")),
            Expanded(
              child: Container(
                child: Scrollbar(
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "From: " +
                                  weatherController
                                      .weatherData.value.alerts[0].senderName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  fontSize: 20.0),
                            ),
                            Text(weatherController
                                .weatherData.value.alerts[0].description),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
