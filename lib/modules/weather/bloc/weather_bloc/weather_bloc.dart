import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

import 'package:weather_repository/weather_repository.dart';
import 'package:weather_app/utils/default_locations.dart' show defaultLocations;
import 'package:weather_app/utils/storage.dart' show Storage;

part 'weather_state.dart';

// Main bloc to manage the app state.
class WeatherBloc extends Cubit<WeatherState> {
  // initial state.
  WeatherBloc({
    required this.repository,
  }) : super(WeatherState.initialState());

  final WeatherDataProvider repository;

  // Fetch weathers to the state.
  void fetchWeathers(String woeid) async {
    try {
      emit(state.copyWith(loading: true));

      var weathers = await repository.getWeather(woeid);

      emit(state.copyWith(loading: false, weathers: weathers));
    } catch (error) {
      emit(state.copyWith(loading: false));
    }
  }

  // Load default locations.
  void loadDefaultLocations() async {
    emit(state.copyWith(loading: true));

    var woeid = (await Storage.getWoeid()) ?? '';

    var selectedLocation = defaultLocations.firstWhere(
      (e) => e.woeid.toString() == woeid,
      orElse: () => defaultLocations.first,
    );

    emit(
      state.copyWith(
        locations: defaultLocations,
        selectedLocation: selectedLocation,
      ),
    );
    fetchWeathers(selectedLocation.woeid.toString());
  }

  // Change selected location.
  void changeSelectedLocation(Location location) {
    Storage.setWoeid(location.woeid.toString());

    emit(state.copyWith(selectedLocation: location));
    fetchWeathers(location.woeid.toString());
  }

  // Adds a location to our list of locations.
  void addLocation(Location location) {
    emit(state.copyWith(locations: [...state.locations, location]));
  }
}
