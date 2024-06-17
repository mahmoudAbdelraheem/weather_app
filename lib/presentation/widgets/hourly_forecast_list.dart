import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast_item.dart';

class HourlyForecastList extends StatelessWidget {
  final WeatherModel data ;
  const HourlyForecastList({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0,10,0,20),
      child: SizedBox(
        height: 120,
        child: ListView.builder(
          itemCount: data.hourlyForecast.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final hourlySky = data.hourlyForecast[index].hourlySky;
            final hourlyTemp =
                data.hourlyForecast[index].hourlyTemp.toStringAsFixed(2);
            final time = data.hourlyForecast[index].time;
            return HourlyForecastItem(
              time: DateFormat.j().format(time),
              temperature: hourlyTemp.toString(),
              icon: hourlySky == 'Clouds' || hourlySky == 'Rain'
                  ? Icons.cloud
                  : Icons.sunny,
            );
          },
        ),
      ),
    );
  }
}
