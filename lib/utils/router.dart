import 'package:flutter/material.dart';
// Bloc, pages and repository
import 'package:weather_app/modules/weather/weather.dart';

// Http package to http request.
import 'package:http/http.dart' as http;

// Route Handler.
Map<String, WidgetBuilder> getAppRoutes() {
  // Prepare repository to be consumed by the bloc.
  var repository = WeatherRepository(httpClient: http.Client());

  /// Bloc that control the logic of the whole app
  /// After i created my bloc i call [loadDefaultLocations].
  var weatherBloc = WeatherBloc(repository: repository)..loadDefaultLocations();

  // Routes.
  return {
    '/': (context) => ForecastListPage.page(weatherBloc: weatherBloc),
    '/settings': (context) => SettingsPage.page(weatherBloc: weatherBloc),
    '/details': (context) => ForecastDetailPage.page(),
  };
}
