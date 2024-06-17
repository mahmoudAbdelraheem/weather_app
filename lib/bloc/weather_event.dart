part of 'weather_bloc.dart';

@immutable
sealed class WeatherEvent {}

final class GetCurrentWeatherByCityNameEvent extends WeatherEvent {
  final String cityName;

  GetCurrentWeatherByCityNameEvent({required this.cityName});
}

final class GetCurrentWeatherBytLocationEvent extends WeatherEvent {
  final double lat;
  final double long;

  GetCurrentWeatherBytLocationEvent({
    required this.lat,
    required this.long,
  });
}
