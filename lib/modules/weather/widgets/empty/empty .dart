import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Empty extends StatelessWidget {
  const Empty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Sorry there's no data.",
        style: TextStyle(
          fontSize: 22,
          color: Colors.black54,
        ),
      ),
    );
  }
}
