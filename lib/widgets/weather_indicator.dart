import 'package:advanced_widget/utils/weather_logo.dart';
import 'package:flutter/material.dart';

class WeatherIndicator extends StatelessWidget {
  final double weather;

  const WeatherIndicator(
    this.weather, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: CustomPaint(
        painter: WeatherLogo(weather),
      ),
    );
  }
}
