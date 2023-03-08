import 'package:flutter/material.dart';
import 'package:onboarding_one/presentation/resources/fonts_manager.dart';

TextStyle _getTextStyleWidget(FontWeight fontWeight, Color color) {
  return TextStyle(fontWeight: fontWeight, color: color);
}

TextStyle getLightStyle(
    {FontWeight fontWeight = FontWeightManager.light, required Color color}) {
  return _getTextStyleWidget(fontWeight, color);
}

TextStyle getSemiBoldStyle(
    {FontWeight fontWeight = FontWeightManager.semiBold,
    required Color color}) {
  return _getTextStyleWidget(fontWeight, color);
}
