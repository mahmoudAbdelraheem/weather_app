import 'package:http/http.dart' as http;
import 'package:weather_app/core/api_config.dart';

class WeatherDataProvider {
  Future<String> getCurrentWeatherByCityName(String cityName) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(ApiConfig.getWeatherByCityName(cityName)),
      );
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> getCurrentWeatherByLocation(
      double lat, double long) async {
    try {
      final http.Response response = await http.get(
        Uri.parse(
          ApiConfig.getWeatherByUserLocation(
            double.parse(lat.toStringAsFixed(2)),
            double.parse(long.toStringAsFixed(2)),
          ),
        ),
      );
      return response.body;
    } catch (e) {
      throw e.toString();
    }
  }
}
