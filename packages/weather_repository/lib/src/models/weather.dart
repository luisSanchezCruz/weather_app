import 'package:equatable/equatable.dart';

/// [Weather] this class represents the  weather
///  of a specific location.
class Weather extends Equatable {
  const Weather._({
    required this.stateName,
    required this.stateAbbr,
    required this.date,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.humidity,
    required this.windSpeed,
  });

  // Gets the name of day.
  String get dayOfTheWeek {
    switch (date.weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'sunday';
      default:
        return '';
    }
  }

  String get temperatureRange => '${minTemp.floor()}°/${maxTemp.floor()}°';

  String get iconUrl =>
      'https://www.metaweather.com/static/img/weather/png/64/$stateAbbr.png';

  String get imageUrl =>
      'https://www.metaweather.com/static/img/weather/png/$stateAbbr.png';

  String get humidityText => '$humidity%';

  String get windSpeedText => '${windSpeed.floor()} mph';

  // Weather state name.
  final String stateName;

  // Weather state name abbrevation.
  final String stateAbbr;

  // Aplicable date.
  final DateTime date;

  // Current Temperature in Celcius.
  final num temp;

  // Min Temperature.
  final num minTemp;

  // Max temperature.
  final num maxTemp;

  // Humidity percent.
  final num humidity;

  // Wind speed(mph).
  final num windSpeed;

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather._(
      stateName: json['weather_state_name'],
      stateAbbr: json['weather_state_abbr'],
      date: DateTime.tryParse(json['applicable_date']) ?? DateTime.now(),
      humidity: json['humidity'],
      temp: json['the_temp'],
      minTemp: json['min_temp'],
      maxTemp: json['max_temp'],
      windSpeed: json['wind_speed'],
    );
  }

  static List<Weather> fromList(List<dynamic> data) {
    return data.map<Weather>((e) => Weather.fromJson(e)).toList();
  }

  // Handy for testing.
  static final empty = Weather._(
    stateName: '',
    stateAbbr: '',
    date: DateTime.now(),
    temp: 0,
    minTemp: 0,
    maxTemp: 0,
    humidity: 0,
    windSpeed: 0,
  );

  @override
  List<Object> get props => [
        stateName,
        stateAbbr,
        date,
        humidity,
        temp,
        minTemp,
        maxTemp,
        windSpeed,
      ];
}
