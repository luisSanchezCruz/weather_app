part of 'forecast_list_page.dart';

class ForecastListView extends StatelessWidget {
  const ForecastListView({Key? key}) : super(key: key);

  // Open settings page.
  void handleOpenSettings(BuildContext context) {
    Navigator.pushNamed(context, SettingsPage.route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: const WeatherList(),
    );
  }

  // Build the appbar
  AppBar _buildAppBar(BuildContext context) => AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 25,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        actions: [
          IconButton(
            color: Colors.black54,
            iconSize: 30,
            onPressed: () => handleOpenSettings(context),
            icon: const Icon(Icons.settings),
          )
        ],
      );
}
