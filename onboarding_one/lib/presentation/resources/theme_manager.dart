import 'package:flutter/material.dart';
import 'package:onboarding_one/presentation/resources/styles_manager.dart';

ThemeData getAppTheme() {
  return ThemeData(
      textTheme: TextTheme(
    headlineMedium: getSemiBoldStyle(color: Colors.black),
    titleLarge: getLightStyle(color: Colors.black),
  ));
}
