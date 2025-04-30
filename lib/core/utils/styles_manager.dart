import 'dart:ui';

import 'package:treat/core/utils/font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) {
  return TextStyle(
    fontFamily: 'Montserrat',
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
  );
}

// light text style
TextStyle getLightStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.light,
    color: color,
  );
}

// regular text style
TextStyle getRegularStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.regular,
    color: color,
  );
}
// medium text style
TextStyle getMediumStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.medium,
    color: color,
  );
}
// semiBold text style
TextStyle getSemiBoldStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.semiBold,
    color: color,
  );
}
// bold text style  
TextStyle getBoldStyle({
  double fontSize = FontSizeManager.s12,
  required Color color,
}) {
  return _getTextStyle(
    fontSize: fontSize,
    fontWeight: FontWeightManager.bold,
    color: color,
  );
}