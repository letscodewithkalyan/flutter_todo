import 'package:demo_flutter/data/datasources/weather_data_source.dart';
import 'package:demo_flutter/data/repositories/weather_repository_impl.dart';
import 'package:demo_flutter/domain/repositories/weather_repository.dart';
import 'package:demo_flutter/domain/usecases/get_current_weather.dart';
import 'package:demo_flutter/presentation/feature/auth/bloc/authentication_bloc.dart';
import 'package:demo_flutter/presentation/feature/weather/weather_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;
void init() {
  //bloc
  locator.registerFactory(() => WeatherBloc(locator()));
  locator.registerFactory(() => AuthenticationBloc());

  //usecase
  locator.registerLazySingleton(() => GetCurrentWeather(locator()));

  //repository
  locator.registerLazySingleton<WeatherRepository>(
      () => WeatherRepositoryImpl(weatherDataSource: locator()));

  //data source
  locator.registerLazySingleton<WeatherDataSource>(
      () => WeatherDataSourceImpl(client: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}
