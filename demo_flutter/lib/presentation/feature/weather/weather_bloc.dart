import 'package:demo_flutter/domain/entities/weather.dart';
import 'package:demo_flutter/domain/usecases/get_current_weather.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeather _getCurrentWeather;

  @override
  WeatherBloc(this._getCurrentWeather) : super(WeatherEmpty()) {
    on<OnCityChanged>(
      fetchProfileEvent,
      transformer: debounce(const Duration(microseconds: 500)),
    );
  }

  Future<void> fetchProfileEvent(
      OnCityChanged event, Emitter<WeatherState> emit) async {
    final cityName = event.cityName;
    emit(WeatherLoading());

    final result = await _getCurrentWeather.execute(cityName);
    result.fold((failure) {
      emit(WeatherError(failure.message));
    }, (data) {
      emit(WeatherHasData(data));
    });
  }

  EventTransformer<T> debounce<T>(Duration duration) {
    return (events, mapper) =>
        events.debounceTime(duration).asyncExpand(mapper);
  }
}
