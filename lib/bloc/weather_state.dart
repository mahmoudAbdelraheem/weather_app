part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherSuccessState extends WeatherState {
  final WeatherModel weather;
  WeatherSuccessState({required this.weather});
}

final class WeatherFailureState extends WeatherState {
  final String message;
  WeatherFailureState({required this.message});
}

final class WeatherLoadingState extends WeatherState {}
