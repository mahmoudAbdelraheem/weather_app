import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/bloc/weather_bloc.dart';
import 'package:weather_app/core/constant.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/presentation/widgets/additional_information_list.dart';
import 'package:weather_app/presentation/widgets/custom_error.dart';
import 'package:weather_app/presentation/widgets/custom_loading.dart';
import 'package:weather_app/presentation/widgets/hourly_forecast_list.dart';
import 'package:weather_app/presentation/widgets/main_temp_card.dart';
import 'package:weather_app/services/location_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //? create a dropdown mnue items to display cities names
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(
          GetCurrentWeatherByCityNameEvent(cityName: 'Cairo'),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (context, state) {
        if (state is WeatherFailureState) {
          return CustomError(message: state.message);
        }
        if (state is! WeatherSuccessState) {
          return const CustomLoading();
        }
        final WeatherModel data = state.weather;
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '${data.country} - ${data.city}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                tooltip: 'Get Weather By Location',
                onPressed: () async {
                  final Position position =
                      await _locationService.getCurrentLocation();
                  if (context.mounted) {
                    context.read<WeatherBloc>().add(
                          GetCurrentWeatherBytLocationEvent(
                            lat: position.latitude,
                            long: position.longitude,
                          ),
                        );
                  }
                },
                icon: const Icon(Icons.location_on),
              ),
              IconButton(
                tooltip: 'Get Weather By City Name',
                icon: const Icon(Icons.location_city),
                onPressed: () {
                  showMenu(
                    context: context,
                    position: const RelativeRect.fromLTRB(100, 100, 0, 0),
                    items: egyptCities.map((String city) {
                      return PopupMenuItem<String>(
                        value: city,
                        child: Text(city),
                      );
                    }).toList(),
                  ).then((selectedCity) {
                    if (selectedCity != null) {
                      context.read<WeatherBloc>().add(
                            GetCurrentWeatherByCityNameEvent(
                                cityName: selectedCity),
                          );
                    }
                  });
                },
              ),
            ],
          ),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? main card
                  MainTempCard(data: data),
                  const Text(
                    'Hourly Forecast',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //? build hourly forecast list items
                  HourlyForecastList(data: data),
                  const Text(
                    'Additional Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  AdditionalInformationList(data: data),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
