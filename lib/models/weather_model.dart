import 'package:weather_app/models/hourly_forecast_model.dart';

class WeatherModel {
  final String city;
  final String country;
  final double currentTemp;
  final String currentSky;
  final double currentPressure;
  final double currentWindSpeed;
  final double currentHumidity;
  final List<HourlyForecastModel> hourlyForecast;

  WeatherModel({
    required this.city,
    required this.country,
    required this.currentTemp,
    required this.currentSky,
    required this.currentPressure,
    required this.currentWindSpeed,
    required this.currentHumidity,
    required this.hourlyForecast,
  });

  factory WeatherModel.formJson(Map<String, dynamic> json) {
    var list = json['list'] as List;
    final currentWeatherData = json['list'][0];
    return WeatherModel(
      city: json['city']['name'],
      country: json['city']['country'],
      currentTemp: currentWeatherData['main']['temp'].toDouble() - 273.15, //? Convert temp from Kelvin to Celsius (-273.15)
      currentSky: currentWeatherData['weather'][0]['main'],
      currentPressure: currentWeatherData['main']['pressure'].toDouble(),
      currentWindSpeed: currentWeatherData['wind']['speed'].toDouble(),
      currentHumidity: currentWeatherData['main']['humidity'].toDouble(),
      hourlyForecast: list
          .sublist(1) //? Getting the next 5 elements
          .map((item) => HourlyForecastModel.fromJson(item))
          .toList(),
    );
  }
}
