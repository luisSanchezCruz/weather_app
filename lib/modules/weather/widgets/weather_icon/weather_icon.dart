import 'package:flutter/cupertino.dart';

class WeatherIcon extends StatelessWidget {
  const WeatherIcon({
    Key? key,
    required this.url,
    this.height = 64.0,
    this.width = 64.0,
  }) : super(key: key);

  final String url;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      url,
      height: height,
      fit: BoxFit.fill,
      width: width,
    );
  }
}
