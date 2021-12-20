import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/modules/weather/weather.dart';

class SearchAppBar extends StatelessWidget with PreferredSizeWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size(double.infinity, 56);

  void textChange(BuildContext context, String value) {
    context.read<SearchBloc>().changeQuery(value);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 0,
      titleSpacing: 0,
      automaticallyImplyLeading: false,
      foregroundColor: Colors.black54,
      backgroundColor: Colors.white,
      title: TextField(
        style: const TextStyle(fontSize: 18),
        onChanged: (value) => textChange(context, value),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(top: 13),
          prefixIcon: IconButton(
            color: Colors.black54,
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          border: InputBorder.none,
          hintText: 'Search...',
        ),
      ),
    );
  }
}
