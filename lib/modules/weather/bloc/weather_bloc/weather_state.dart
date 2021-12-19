part of 'weather_bloc.dart';

/// [WeatherState] represent the app state.
class WeatherState extends Equatable {
  // Private constuctor so that others developer can not mess
  // with my class.
  const WeatherState._({
    this.locations = const [],
    this.weathers = const [],
    this.loading = false,
    this.selectedLocationWoeid = '',
  });

  factory WeatherState.initialState() {
    return const WeatherState._();
  }

  // List of locations.
  final List<LocationResult> locations;

  //List of weathers.
  final List<Weather> weathers;

  // Is the app loading any data?.
  final bool loading;

  // Selected location woeid.
  final String selectedLocationWoeid;

  WeatherState copyWith({
    List<LocationResult>? locations,
    List<Weather>? weathers,
    bool? loading,
    String? selectedLocationWoeid,
  }) =>
      WeatherState._(
        locations: locations ?? this.locations,
        weathers: weathers ?? this.weathers,
        loading: loading ?? this.loading,
        selectedLocationWoeid:
            selectedLocationWoeid ?? this.selectedLocationWoeid,
      );

  @override
  List<Object> get props => [
        locations,
        weathers,
        loading,
        selectedLocationWoeid,
      ];
}
