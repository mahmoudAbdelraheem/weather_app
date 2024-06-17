import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/additional_info_item.dart';

class AdditionalInformationList extends StatelessWidget {
  final WeatherModel data;
  const AdditionalInformationList({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AdditionalInfoItem(
            icon: Icons.water_drop,
            label: 'Humidity',
            value: data.currentHumidity.toString(),
          ),
          AdditionalInfoItem(
            icon: Icons.air,
            label: 'Wind Speed',
            value: data.currentWindSpeed.toString(),
          ),
          AdditionalInfoItem(
            icon: Icons.beach_access,
            label: 'Pressure',
            value: data.currentPressure.toString(),
          ),
        ],
      ),
    );
  }
}
