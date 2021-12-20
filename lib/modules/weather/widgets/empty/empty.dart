import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No data found!",
        style: TextStyle(
          fontSize: 22,
          color: Colors.black54,
        ),
      ),
    );
  }
}
