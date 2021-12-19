import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather/weather.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({
    Key? key,
    this.weather,
  }) : super(key: key);

  final Weather? weather;

  // Avoid repeat null check logic.
  Weather get safeWeather => weather!;

  @override
  Widget build(BuildContext context) {
    if (weather == null) {
      return const Empty();
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 20),
          _buildTop(),
          const SizedBox(height: 50),
          _buildDetail(label: 'Humidity', value: safeWeather.humidityText),
          const SizedBox(height: 25),
          _buildDetail(label: 'Widspeed', value: safeWeather.windSpeedText),
        ],
      ),
    );
  }

  Widget _buildTop() {
    return Center(
      child: Column(
        children: [
          Text(
            safeWeather.dayOfTheWeek,
            style: const TextStyle(
              fontSize: 28,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 20),
          Hero(
            tag: safeWeather.date.toString(),
            child: WeatherIcon(
              url: safeWeather.imageUrl,
              height: 120,
              width: 120,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            safeWeather.temperatureRange,
            style: const TextStyle(
              fontSize: 35,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetail({
    required String label,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black54,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 22,
              color: Colors.black54,
            ),
          )
        ],
      ),
    );
  }
}
