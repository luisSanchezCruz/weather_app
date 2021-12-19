import 'dart:convert';
import 'package:weather_repository/weather_repository.dart';
import 'package:http/http.dart' as http;

/// [WeatherRepository] is the source of all data.
class WeatherRepository implements WeatherDataProvider {
  WeatherRepository({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  // Http client to make request.
  final http.Client _httpClient;

  // Default scheme.
  static const _scheme = 'https';

  // Base api url.
  static const _baseApiUrl = 'www.metaweather.com';

  /// Search locations based on the [query].
  @override
  Future<List<LocationResult>> getLocationByQuery(String query) async {
    // Create request.
    var request = Uri(
      scheme: _scheme,
      host: _baseApiUrl,
      path: '/api/location/search/',
      queryParameters: {'query': query},
    );

    try {
      // Send request.
      var response = await _httpClient.get(request);

      // If response is succcess
      if (response.statusCode == 200) {
        // Decode body.
        var data = jsonDecode(response.body);

        // Creates a list of [LocationResult] using the decoded data.
        return LocationResult.fromList(data);
      }

      // Return empty list if response is not success.
      return [];
    } catch (error) {
      throw Exception('Server not working sorry.');
    }
  }

  /// Get a list of [Weather] base on the woeid.
  @override
  Future<List<Weather>> getWeather(String woeid) async {
    // Create request.
    var request = Uri(
      scheme: _scheme,
      host: _baseApiUrl,
      path: '/api/location/$woeid/',
    );

    try {
      // Send request.
      var response = await _httpClient.get(request);

      // If response is success.
      if (response.statusCode == 200) {
        // Decode data and get the array of weathers.
        var data = jsonDecode(response.body)['consolidated_weather'];

        // Creates a list of [Weather] from data.
        return Weather.fromList(data as List);
      }

      // Empty list if not success.
      return [];
    } catch (error) {
      throw Exception('Server not working sorry.');
    }
  }
}
