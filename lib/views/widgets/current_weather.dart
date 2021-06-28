import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp/controllers/settings_controller.dart';
import 'package:weatherapp/controllers/weather_controller.dart';

class CurrentWeather extends StatelessWidget {
  final todaysDate = DateFormat.yMMMd().format(DateTime.now());
  final String baseImageURL = "https://openweathermap.org/img/wn/";
  final WeatherController weatherController = Get.find();
  final SettingsController settingsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: Theme.of(context).primaryColor == Colors.black
            ? LinearGradient(colors: [
                Color.fromRGBO(115, 30, 74, 1.0),
                Color.fromRGBO(42, 85, 98, 1.0)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
            : LinearGradient(colors: [
                Color.fromRGBO(255, 255, 255, 1.0),
                Color.fromRGBO(255, 255, 255, 1.0)
              ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), //color of shadow
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 2), // changes position of shadow
            //left-right, top to down
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 200.0,
                width: 150.0,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Theme.of(context).accentColor)),
                      SizedBox(height: 5.0),
                      Text(
                        todaysDate,
                        style: TextStyle(color: Theme.of(context).accentColor),
                      ),
                      SizedBox(height: 10.0),
                      CircleAvatar(
                        backgroundImage: NetworkImage(baseImageURL +
                            weatherController
                                .weatherData.value.current.weather[0].icon +
                            '@2x.png'),
                        backgroundColor: Colors.white,
                        radius: 35.0,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          weatherController.descriptionToProperCase(
                              weatherController.weatherData.value.current
                                  .weather[0].description),
                          style: TextStyle(
                              fontSize: 11,
                              color: Theme.of(context).accentColor),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 200.0,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Details',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                color: Theme.of(context).accentColor)),
                        SizedBox(height: 5.0),
                        Row(children: [
                          Text('Min:',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          Text(
                              ' ' +
                                  weatherController
                                      .weatherData.value.daily[0].temp.min
                                      .toInt()
                                      .toString(),
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            settingsController.selectedUnits.value == "Standard"
                                ? "K"
                                : "°",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                        SizedBox(height: 5.0),
                        Row(children: [
                          Text('Max:',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          Text(
                              ' ' +
                                  weatherController
                                      .weatherData.value.daily[0].temp.max
                                      .toInt()
                                      .toString(),
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            settingsController.selectedUnits.value == "Standard"
                                ? "K"
                                : "°",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                        SizedBox(height: 5.0),
                        Row(children: [
                          Text('Feels Like:',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          Text(
                              ' ' +
                                  weatherController
                                      .weatherData.value.current.feelsLike
                                      .toInt()
                                      .toString(),
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            settingsController.selectedUnits.value == "Standard"
                                ? "K"
                                : "°",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ]),
                        SizedBox(height: 5.0),
                        Row(children: [
                          Text('Wind Speed:',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          Text(
                              ' ' +
                                  weatherController
                                      .weatherData.value.daily[0].windSpeed
                                      .toPrecision(1)
                                      .toString(),
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              settingsController.selectedUnits.value ==
                                      "Imperial"
                                  ? "mph"
                                  : "mps",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ]),
                        SizedBox(height: 5.0),
                        Row(children: [
                          Text('Humidity:',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor)),
                          Text(
                              ' ' +
                                  weatherController
                                      .weatherData.value.daily[0].humidity
                                      .toString() +
                                  '%',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor,
                                  fontWeight: FontWeight.bold))
                        ]),
                        SizedBox(height: 5.0),
                        Row(
                          children: [
                            Text('POP:',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor)),
                            Text(
                                ' ' +
                                    ((weatherController.weatherData.value
                                                .daily[0].pop) *
                                            100)
                                        .toString() +
                                    '%',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
