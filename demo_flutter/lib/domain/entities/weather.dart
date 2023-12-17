import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Weather extends Equatable {
  final String cityName;
  final String main;
  final String description;
  final String iconCode;
  final String temperature;
  final int pressure;
  final int humidity;
  const Weather({
    required this.cityName,
    required this.description,
    required this.humidity,
    required this.iconCode,
    required this.main,
    required this.pressure,
    required this.temperature,
  });

  @override
  // TODO: implement props
  List<Object?> get props =>
      [cityName, description, humidity, iconCode, main, pressure, temperature];
}
