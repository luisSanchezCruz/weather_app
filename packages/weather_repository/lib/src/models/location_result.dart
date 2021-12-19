import 'package:equatable/equatable.dart';

/// [LocationResult] result of the search endpoint.
class LocationResult extends Equatable {
  const LocationResult._({
    required this.title,
    required this.locationType,
    required this.lattLong,
    required this.woeid,
  });

  // Name of the location.
  final String title;

  // Location type(City|Region / State / Province|Country|Continent).
  final String locationType;

  // Coordinates -122.95,88.65.
  final String lattLong;

  // Where On Earth ID.
  final int woeid;

  factory LocationResult.fromJson(Map<String, dynamic> json) {
    return LocationResult._(
      title: json['title'],
      locationType: json['location_type'],
      lattLong: json['latt_long'],
      woeid: json['woeid'],
    );
  }
  // Transform data to a list of LocationResult.
  static List<LocationResult> fromList(List<Map<String, dynamic>> data) {
    return data.map<LocationResult>((e) => LocationResult.fromJson(e)).toList();
  }

  // Handy for testing.
  static const empty = LocationResult._(
    title: 'Londom',
    locationType: 'City',
    lattLong: '-122.56,88.95',
    woeid: 2488867,
  );

  @override
  List<Object> get props => [
        title,
        locationType,
        lattLong,
        woeid,
      ];
}
