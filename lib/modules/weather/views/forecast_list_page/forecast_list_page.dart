import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

part 'forecast_list_view.dart';

class ForecastListPage extends StatelessWidget {
  const ForecastListPage._({
    Key? key,
    required this.weatherBloc,
  }) : super(key: key);

  static const String route = '/';

  static Widget page({required WeatherBloc weatherBloc}) {
    return ForecastListPage._(weatherBloc: weatherBloc);
  }

  final WeatherBloc weatherBloc;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: weatherBloc,
      child: const ForecastListView(),
    );
  }
}
