part of 'forecast_detail_page.dart';

class ForeCastDetailView extends StatelessWidget {
  const ForeCastDetailView({
    Key? key,
    this.weather,
  }) : super(key: key);

  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: WeatherView(weather: weather),
    );
  }

  AppBar _buildAppBar() => AppBar(
        foregroundColor: Colors.black54,
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      );
}
