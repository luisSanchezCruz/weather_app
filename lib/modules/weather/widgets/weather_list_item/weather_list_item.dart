import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather/weather.dart';

class WeatherListItem extends StatelessWidget {
  const WeatherListItem({
    Key? key,
    required this.weather,
  }) : super(key: key);

  final Weather weather;

  String get dayOfWeek {
    return weather.date.weekday == DateTime.now().weekday
        ? 'Today'
        : weather.dayOfTheWeek;
  }

  void openForecastDetailPage(BuildContext context) {
    Navigator.of(context).pushNamed(
      ForecastDetailPage.route,
      arguments: ForeCastDetailPageArguments(weather: weather),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black87),
          borderRadius: BorderRadius.circular(8)),
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 8,
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
          title: Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Colors.black54,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                weather.temperatureRange,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(width: 20),
              Hero(
                tag: weather.date.toString(),
                child: WeatherIcon(
                  url: weather.iconUrl,
                  height: 40,
                  width: 40,
                ),
              )
            ],
          ),
          onTap: () => openForecastDetailPage(context),
        ),
      ),
    );
  }
}
