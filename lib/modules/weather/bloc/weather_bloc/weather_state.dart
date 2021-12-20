part of 'weather_bloc.dart';

/// [WeatherState] represent the app state.
class WeatherState extends Equatable {
  // Private constuctor so that others developer can not mess
  // with my class.
  const WeatherState._({
    this.locations = const [],
    this.weathers = const [],
    this.loading = false,
    this.selectedLocation = Location.empty,
  });

  factory WeatherState.initialState() {
    return const WeatherState._();
  }

  // List of locations.
  final List<Location> locations;

  //List of weathers.
  final List<Weather> weathers;

  // Is the app loading any data?.
  final bool loading;

  // Selected location.
  final Location selectedLocation;

  WeatherState copyWith({
    List<Location>? locations,
    List<Weather>? weathers,
    bool? loading,
    Location? selectedLocation,
  }) =>
      WeatherState._(
        locations: locations ?? this.locations,
        weathers: weathers ?? this.weathers,
        loading: loading ?? this.loading,
        selectedLocation: selectedLocation ?? this.selectedLocation,
      );

  @override
  List<Object> get props => [
        locations,
        weathers,
        loading,
        selectedLocation,
      ];
}
