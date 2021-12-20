import 'package:equatable/equatable.dart';

/// [Location] result of the search endpoint.
class Location extends Equatable {
  const Location._({
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

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location._(
      title: json['title'],
      locationType: json['location_type'],
      lattLong: json['latt_long'],
      woeid: json['woeid'],
    );
  }
  // Transform data to a list of LocationResult.
  static List<Location> fromList(List<dynamic> data) {
    return data.map<Location>((e) => Location.fromJson(e)).toList();
  }

  // Handy for testing.
  static const empty = Location._(
    title: '',
    locationType: '',
    lattLong: '',
    woeid: 0,
  );

  @override
  List<Object> get props => [
        title,
        locationType,
        lattLong,
        woeid,
      ];
}
