import 'package:demo_flutter/domain/usecases/get_current.weather.dart';
import 'package:demo_flutter/presentation/feature/weather/weather_event.dart';
import 'package:demo_flutter/presentation/feature/weather/weather_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      (event, emit) async {
        final cityName = event.cityName;
        emit(WeatherLoading());

        final result = await _getCurrentWeather.execute(cityName);
        result.fold((failure) {
          emit(WeatherError(failure.message));
        }, (data) {
          emit(WeatherHasData(data));
        });
      },
      transformer: debounce(const Duration(microseconds: 500)),
    );
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) => events.debounceTime(duration);
  }
}
