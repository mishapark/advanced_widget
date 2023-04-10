import 'package:flutter/material.dart';

class AppColorTheme extends InheritedWidget {
  final List<AppColor> profiles;
  final Function onProfileChanged;
  final int currentIndex;

  const AppColorTheme({
    super.key,
    required Widget child,
    required this.profiles,
    required this.onProfileChanged,
    required this.currentIndex,
  }) : super(child: child);

  static AppColorTheme of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppColorTheme>()!;
  }

  @override
  bool updateShouldNotify(AppColorTheme oldWidget) {
    return currentIndex != oldWidget.currentIndex;
  }
}

class AppColor {
  final Color mainColor;
  final Color secondaryColor;
  final Color textColor;

  AppColor({
    required this.mainColor,
    required this.secondaryColor,
    required this.textColor,
  });
}
