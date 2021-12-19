import 'package:flutter/material.dart';
import 'package:weather_app/utils/router.dart';

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      routes: getAppRoutes(),
      initialRoute: '/',
    );
  }
}
