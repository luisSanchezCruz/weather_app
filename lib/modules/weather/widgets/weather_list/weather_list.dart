import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Watch for states changes.
    var weathers = context.watch<WeatherBloc>().state.weathers;
    var loading = context.watch<WeatherBloc>().state.loading;

    if (loading) return const Loader();

    return ListView.builder(
      // use length + 1 to add the location title.
      itemCount: weathers.length + 1,
      itemBuilder: (context, index) {
        // Puts the location title on top of the list.
        if (index == 0) return _buildTitle(context);

        return WeatherListItem(weather: weathers[index - 1]);
      },
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, bottom: 5),
      child: Text(
        context.read<WeatherBloc>().state.selectedLocation.title,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.black54,
        ),
      ),
    );
  }
}
