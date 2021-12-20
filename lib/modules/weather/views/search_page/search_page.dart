import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

part 'search_view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage._({
    Key? key,
    required this.weatherBloc,
  }) : super(key: key);

  static String route = '/search';

  final WeatherBloc weatherBloc;

  static Widget page({required WeatherBloc weatherBloc}) {
    return SearchPage._(weatherBloc: weatherBloc);
  }

  @override
  Widget build(BuildContext context) {
    // Prepare search bloc to be injected to the ui.
    var searchBloc = SearchBloc(
      repository: weatherBloc.repository,
      weatherBloc: weatherBloc,
    );

    return BlocProvider(
      create: (context) => searchBloc,
      child: const SearchView(),
    );
  }
}
