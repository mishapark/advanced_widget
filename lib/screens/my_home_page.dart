import 'package:advanced_widget/utils/app_color_theme.dart';
import 'package:advanced_widget/widgets/inner_shadow.dart';
import 'package:advanced_widget/widgets/weather_indicator.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    final profiles = AppColorTheme.of(context);
    final currentProfile = profiles.profiles[profiles.currentIndex];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: currentProfile.secondaryColor,
      ),
      backgroundColor: currentProfile.mainColor,
      body: Stack(
        children: [
          Positioned(
            top: selected ? height / 2 : 0,
            right: selected ? width / 2 - 100 : 0,
            width: selected ? 200 : 0,
            height: selected ? 100 : 0,
            child: InnerShadow(
              shadows: const [
                Shadow(
                  blurRadius: 1,
                  color: Colors.black,
                  offset: Offset(1, 1),
                )
              ],
              child: Text(
                'Cloudy, 15 degrees',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: currentProfile.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 500),
            width: selected ? 200.0 : 100.0,
            height: selected ? 200.0 : 100.0,
            top: selected ? height / 5 : 10,
            right: selected ? width / 2 - 100 : 10,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: const WeatherIndicator(1),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          profiles.onProfileChanged();
        },
        tooltip: 'Change color',
        backgroundColor: currentProfile.secondaryColor,
        child: const Icon(Icons.color_lens),
      ),
    );
  }
}
