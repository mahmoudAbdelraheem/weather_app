class HourlyForecastModel {
  final DateTime time;
  final String hourlySky;
  final double hourlyTemp;

  HourlyForecastModel({
    required this.time,
    required this.hourlySky,
    required this.hourlyTemp,
  });

  factory HourlyForecastModel.fromJson(Map<dynamic, dynamic> json) {
    //! json  = data['list'][index + 1]
    return HourlyForecastModel(
      time: DateTime.parse(json['dt_txt']),
      hourlySky: json['weather'][0]['main'],
      hourlyTemp: json['main']['temp'].toDouble() - 273.15, //? Convert temp from Kelvin to Celsius (-273.15)
    );
  }
}


