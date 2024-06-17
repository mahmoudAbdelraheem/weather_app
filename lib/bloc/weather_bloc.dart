import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/repository/weather_repository.dart';
import 'package:weather_app/models/weather_model.dart';
part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc({required this.weatherRepository}) : super(WeatherInitial()) {
    on<GetCurrentWeatherByCityNameEvent>(_getCurrentWeatherByCityName);
    on<GetCurrentWeatherBytLocationEvent>(
        _getCurrentWeatherByLocation);
  }

  FutureOr<void> _getCurrentWeatherByCityName(
    GetCurrentWeatherByCityNameEvent event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoadingState());
    try {
      final weather =
          await weatherRepository.getCurrentWeatherByCityName(event.cityName);
      emit(WeatherSuccessState(weather: weather));
    } catch (e) {
      emit(WeatherFailureState(message: e.toString()));
    }
  }

  FutureOr<void> _getCurrentWeatherByLocation(
      GetCurrentWeatherBytLocationEvent event,
      Emitter<WeatherState> emit,) async{
         emit(WeatherLoadingState());
    try {
      final weather =
          await weatherRepository.getCurrentWeatherByLocation(event.lat, event.long);
      emit(WeatherSuccessState(weather: weather));
    } catch (e) {
      emit(WeatherFailureState(message: e.toString()));
    }
      }
}
