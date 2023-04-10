import 'package:advanced_widget/screens/my_home_page.dart';
import 'package:advanced_widget/utils/app_color_theme.dart';
import 'package:advanced_widget/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<AppColor> _profiles = colors;
  int _currentIndex = 0;

  void _changeProfile() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % _profiles.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppColorTheme(
      currentIndex: _currentIndex,
      onProfileChanged: _changeProfile,
      profiles: _profiles,
      child: Builder(
        builder: (innerContext) {
          return const MaterialApp(
            title: 'Flutter Demo',
            home: MyHomePage(title: 'Flutter Demo Home Page'),
          );
        },
      ),
    );
  }
}
