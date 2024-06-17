import 'dart:convert';

import 'package:weather_app/data/data_provider/weather_data_provider.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherRepository {
  final WeatherDataProvider weatherDataProvider;

  WeatherRepository({required this.weatherDataProvider});
  Future<WeatherModel> getCurrentWeatherByCityName(String cityName) async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeatherByCityName(cityName);

      final data = jsonDecode(weatherData);
      if (data['cod'] == '200') {
        return WeatherModel.formJson(data);
      } else {
        throw 'Failed to load weather data';
      }
    } catch (e) {
      throw e.toString();
    }
  }
  Future<WeatherModel> getCurrentWeatherByLocation(double lat,double long) async {
    try {
      final weatherData = await weatherDataProvider.getCurrentWeatherByLocation(lat, long);

      final data = jsonDecode(weatherData);
      if (data['cod'] == '200') {
        return WeatherModel.formJson(data);
      } else {
        throw 'Failed to load weather data';
      }
    } catch (e) {
      throw e.toString();
    }
  }
}
