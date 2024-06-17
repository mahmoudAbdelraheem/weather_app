import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';

class MainTempCard extends StatelessWidget {
  const MainTempCard({
    super.key,
    required this.data,
  });

  final WeatherModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: SizedBox(
        width: double.infinity,
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10,
                sigmaY: 10,
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text(
                      '${data.currentTemp.toStringAsFixed(2)} °C',
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Icon(
                      data.currentSky == 'Clouds' || data.currentSky == 'Rain'
                          ? Icons.cloud
                          : Icons.sunny,
                      size: 64,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      data.currentSky,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
