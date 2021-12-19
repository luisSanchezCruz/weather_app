import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

part 'settings_view.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage._({Key? key, required this.weatherBloc}) : super(key: key);

  final WeatherBloc weatherBloc;

  static const String route = '/settings';

  static Widget page({required WeatherBloc weatherBloc}) {
    return SettingsPage._(weatherBloc: weatherBloc);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: weatherBloc,
      child: const SettingsView(),
    );
  }
}
