import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherapp/models/weather_model.dart';

class WeatherService {
  String baseUrl = "https://api.openweathermap.org/data/2.5/weather";
  String apiKey = "8d18de20ce0f29d6c793a8d1f90babe7";

  Future<WeatherModel> getWeather(String city) async {
    Uri url = Uri.parse("$baseUrl?q=$city&appid=$apiKey");
    final response = await http.get(url);

    try {
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return WeatherModel.fromJson(data);
      } else {
        throw Exception('Failed to load the meaning');
      }
    } catch (e) {
      throw Exception('Failed to load the meaning');
    }
  }
}
