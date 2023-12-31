import 'dart:convert';

import 'package:demo_flutter/data/ServerException.dart';
import 'package:demo_flutter/data/constants.dart';
import 'package:demo_flutter/data/models/weather_model.dart';
import 'package:http/http.dart' as http;

abstract class WeatherDataSource {
  Future<WeatherModel> getCurrentWeather(String cityName);
}

class WeatherDataSourceImpl implements WeatherDataSource {
  final http.Client client;
  WeatherDataSourceImpl({required this.client});
  @override
  Future<WeatherModel> getCurrentWeather(String cityName) async {
    final response =
        await client.get(Uri.parse(Urls.currentWeatherByName(cityName)));

    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
