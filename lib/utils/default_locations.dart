import 'package:weather_repository/weather_repository.dart';

// Data.
var locations = [
  {
    "title": "San Francisco",
    "location_type": "City",
    "woeid": 2487956,
    "latt_long": "37.777119, -122.41964"
  },
  {
    "title": "Osaka",
    "location_type": "City",
    "woeid": 15015370,
    "latt_long": "34.6775,135.5032"
  },
  {
    "title": "San Diego",
    "location_type": "City",
    "woeid": 2487889,
    "latt_long": "32.715691,-117.161720"
  },
];

// Default hardcoded locations.
List<Location> defaultLocations = Location.fromList(locations);
