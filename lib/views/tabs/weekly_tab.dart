import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp/controllers/weather_controller.dart';

class WeeklyWeather extends StatelessWidget {
  final WeatherController weatherController = Get.find();
  @override
  Widget build(BuildContext context) {
    var weatherData = weatherController.weatherData.value;
    var baseImageURL = "https://openweathermap.org/img/wn/";
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Weekly Weather",
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                  itemCount: weatherData.daily.length - 1,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey[300],
                                  blurRadius: 10.0,
                                  offset: Offset(0.0, 3.0))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  weatherController.convertDate(
                                      weatherData.daily[index + 1].dt),
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(height: 20.0),
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 40.0,
                                backgroundImage: NetworkImage(
                                  baseImageURL +
                                      weatherData.daily[index].weather[0].icon +
                                      "@2x.png",
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}
