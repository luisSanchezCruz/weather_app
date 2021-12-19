part of 'settings_page.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({Key? key}) : super(key: key);

  void handleSelect(BuildContext context, int woeid) {
    context.read<WeatherBloc>().changeSelectedLocation(woeid.toString());
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(
      builder: (contex, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            foregroundColor: Colors.black54,
            title: const Text('Settings'),
          ),
          body: ListView.builder(
            // I  use [index + 1] to add the first widget.
            itemCount: state.locations.length + 1,
            itemBuilder: (context, index) {
              if (index == 0) return const SizedBox(height: 40);
              return ListTile(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                title: Text(
                  state.locations[index - 1].title,
                  style: const TextStyle(fontSize: 18),
                ),
                trailing: state.selectedLocationWoeid ==
                        state.locations[index - 1].woeid.toString()
                    ? const Icon(Icons.radio_button_checked)
                    : const Icon(Icons.radio_button_unchecked),
                onTap: () =>
                    handleSelect(context, state.locations[index - 1].woeid),
              );
            },
          ),
        );
      },
    );
  }
}
