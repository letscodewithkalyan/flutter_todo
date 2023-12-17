import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:demo_flutter/data/ServerException.dart';
import 'package:demo_flutter/data/datasources/weather_data_source.dart';
import 'package:demo_flutter/data/failure.dart';
import 'package:demo_flutter/domain/entities/weather.dart';
import 'package:demo_flutter/domain/repositories/weather_repository.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherDataSource weatherDataSource;
  WeatherRepositoryImpl({required this.weatherDataSource});

  @override
  Future<Either<Failure, Weather>> getCurrentWeather(String cityName) async {
    try {
      final result = await weatherDataSource.getCurrentWeather(cityName);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure(''));
    }
  }
}
