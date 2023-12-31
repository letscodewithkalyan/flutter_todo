import 'package:demo_flutter/domain/entities/weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:http/retry.dart';

class WeatherModel extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final double temperature;
  final int pressure;
  final int humidity;

  const WeatherModel({
    required this.cityName,
    required this.main,
    required this.description,
    required this.humidity,
    required this.iconCode,
    required this.pressure,
    required this.temperature,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) => WeatherModel(
        cityName: json['name'],
        main: json['weather'][0]['main'],
        description: json['weather'][0]['description'],
        iconCode: json['weather'][0]['icon'],
        temperature: json['main']['temp'],
        pressure: json['main']['pressure'],
        humidity: json['main']['humidity'],
      );

  Map<String, dynamic> toJson() => {
        'weather': [
          {
            'main': main,
            'description': description,
            'icon': iconCode,
          },
        ],
        'main': {
          'temp': temperature,
          'pressure': pressure,
          'humidity': humidity,
        },
        'name': cityName,
      };

  Weather toEntity() => Weather(
        cityName: cityName,
        main: main,
        description: description,
        iconCode: iconCode,
        temperature: temperature,
        pressure: pressure,
        humidity: humidity,
      );

  @override
  List<Object?> get props =>
      [cityName, main, description, iconCode, temperature, pressure, humidity];
}
