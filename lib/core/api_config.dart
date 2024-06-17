class ApiConfig {
  static const String baseUrl =
      'https://api.openweathermap.org/data/2.5/forecast';
  static const String apiKey = 'd2458f2dde9f3fa60f669f8b0320b015';

  //! get Weather By City Name API
// ? https://api.openweathermap.org/data/2.5/forecast?q=Egypt&&appid=d2458f2dde9f3fa60f669f8b0320b015
  static String getWeatherByCityName(String cityName) =>
      '$baseUrl?q=$cityName&appid=$apiKey';

  //! get Weather By User Location using(geolocator)
//?  https://api.openweathermap.org/data/2.5/forecast?lat=26.09&lon=32.42&appid=d2458f2dde9f3fa60f669f8b0320b015
  static String getWeatherByUserLocation(double lat, double long) =>
      '$baseUrl?lat=$lat&lon=$long&appid=$apiKey';
}
