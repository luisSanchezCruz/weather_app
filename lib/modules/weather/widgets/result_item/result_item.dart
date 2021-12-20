import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather/weather.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultItem extends StatelessWidget {
  const ResultItem({
    Key? key,
    required this.location,
  }) : super(key: key);

  final Location location;

  void select(BuildContext context) {
    context.read<SearchBloc>().selectLocation(location);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location.title),
      subtitle: Text(location.locationType),
      onTap: () => select(context),
    );
  }
}
