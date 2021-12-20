import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

class ResultList extends StatelessWidget {
  const ResultList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var state = context.watch<SearchBloc>().state;

    if (state.loading) return const Loader();

    if (state.results.isEmpty) return const Empty();

    return ListView.separated(
      itemBuilder: (context, index) =>
          ResultItem(location: state.results[index]),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: state.results.length,
    );
  }
}
