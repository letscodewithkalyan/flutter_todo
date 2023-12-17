import 'package:dartz/dartz.dart';
import 'package:demo_flutter/data/failure.dart';
import 'package:demo_flutter/domain/entities/weather.dart';

abstract class WeatherRepository {
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName);
}
