import 'package:flutter/material.dart';
import 'package:weather_app/modules/weather/weather.dart';

part 'forecast_detail_page_arguments.dart';
part 'forecast_detail_view.dart';

class ForecastDetailPage extends StatelessWidget {
  const ForecastDetailPage._({Key? key}) : super(key: key);

  static const String route = '/details';

  static Widget page() => const ForecastDetailPage._();

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context)?.settings.arguments
        as ForeCastDetailPageArguments;

    return ForeCastDetailView(weather: arguments.weather);
  }
}
