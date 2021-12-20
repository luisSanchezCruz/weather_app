import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

part 'search_state.dart';

class SearchBloc extends Cubit<SearchState> {
  SearchBloc({
    required this.repository,
    required this.weatherBloc,
  }) : super(SearchState.initialState());

  final WeatherBloc weatherBloc;
  final WeatherDataProvider repository;
  late Timer? _timer;

  @override
  Future<void> close() async {
    // When this bloc is destoyed we have to make sure we cancel the timer.
    _timer?.cancel();
    super.close();
  }

  void changeQuery(String value) {
    _timer = Timer(const Duration(milliseconds: 200), () {
      if (state.query == value) {
        _search(value);
      }
    });

    emit(state.copyWith(query: value));
  }

  void selectLocation(Location location) {
    weatherBloc.addLocation(location);
  }

  Future<void> _search(String query) async {
    emit(state.copyWith(loading: true));

    try {
      var results = await repository.getLocationByQuery(query);

      emit(
        state.copyWith(
          results: results,
          loading: false,
        ),
      );
    } catch (error) {
      emit(state.copyWith(loading: false));
    }
  }
}
