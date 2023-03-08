import 'package:flutter/material.dart';
import 'package:onboarding_one/presentation/onboarding/onboarding_view/onboardingview.dart';
import 'package:onboarding_one/presentation/resources/theme_manager.dart';

class MyApp extends StatefulWidget {
  // Named Constructore
  MyApp._internal();

  // Single instance
  static final MyApp _instance = MyApp._internal();
  factory MyApp() => _instance;
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(),
      home: const OnBoardingView(),
    );
  }
}
