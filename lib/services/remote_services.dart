// import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:weatherapp/models/weather_model.dart';

// ignore: non_constant_identifier_names
String API_KEY = dotenv.env['API_KEY'];

class RemoteServices {
  static http.Client client = http.Client();

  static Future<Welcome> fetchWeatherData([units = "Metric"]) async {
    http.Response response = await client.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=45.622459&lon=-61.991421&units=$units&appid=$API_KEY'));
    if (response.statusCode == 200) {
      var jsonString = response.body;
      return welcomeFromJson(jsonString);
    } else {
      return null;
    }
  }
}
