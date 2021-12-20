import 'package:weather_repository/weather_repository.dart';

/// [WeatherDataProvider] this way we force the repositories to have a
/// set of functions in order to work in our app.
/// later if we want to change the way we get data for example you want
/// to use a package like dio to make requests, we just have to use
/// this abstract class and create your own repository.
abstract class WeatherDataProvider {
  /// Search locations by a [query].
  Future<List<Location>> getLocationByQuery(String query);

  /// Returns a list of [Weather].
  Future<List<Weather>> getWeather(String woeid);
}
