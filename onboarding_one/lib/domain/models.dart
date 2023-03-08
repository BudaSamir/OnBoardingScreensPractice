import 'package:flutter/animation.dart';

class OnboardingSlider {
  final String title;
  final String desc;
  final String image;
  final Color color;

  OnboardingSlider(
      {required this.title,
      required this.desc,
      required this.image,
      required this.color});
}

class SlidersData {
  OnboardingSlider onboardingSliderInstances;
  int numOfSliders;
  int currentSlider;

  SlidersData(
      {required this.onboardingSliderInstances,
      required this.numOfSliders,
      required this.currentSlider});
}
