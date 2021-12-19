import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    emit(state.copyWith(
      locations: defaultLocations,
      selectedLocationWoeid:
          woeid.isEmpty ? defaultLocations.first.woeid.toString() : woeid,
    ));
    fetchWeathers(defaultLocations[0].woeid.toString());
  }

  // Change selected location.
  void changeSelectedLocation(String woeid) {
    Storage.setWoeid(woeid);

    emit(state.copyWith(selectedLocationWoeid: woeid));
    fetchWeathers(woeid);
  }
}
