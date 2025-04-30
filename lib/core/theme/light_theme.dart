import 'package:flutter/material.dart';
import 'package:treat/core/utils/colors.dart';


class LightAppTheme {
  static ThemeData get() {
    return ThemeData(
      
      brightness: Brightness.light,
      fontFamily: 'OpenSans',
      scaffoldBackgroundColor: const Color(0xffF6F6F6),
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      shadowColor: const Color(0xFF000000),
      cardColor: const Color(0xFFFFFFFF),
      disabledColor: const Color(0xFF797979),
      primaryColor: ColorsManager.primaryColor,
      colorScheme: ColorScheme.light(
        primary: ColorsManager.primaryColor,
        secondary: ColorsManager.secondaryColor,
        error: ColorsManager.errorColor,
        surface: const Color(0xFFE8EBEC),
      ),
      dividerTheme: const DividerThemeData(
        color: Color(0xFFCCD2E3),
        thickness: 0.2,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffF6F6F6),
        elevation: 0,
    
      ),
      textTheme: TextTheme(
        bodySmall: TextStyle(color: ColorsManager.secondaryColor),
        bodyMedium: TextStyle(color: const Color(0xFFB4B4B4)),
        bodyLarge: TextStyle(color: const Color(0xFF474749)),
        displaySmall: TextStyle(color: Colors.white),
        displayMedium: TextStyle(color: const Color(0xFF797979)),
        displayLarge: TextStyle(color: const Color(0xFFF9B9B3)),
        headlineSmall: TextStyle(color: const Color(0xFFF25822)),
        labelSmall: TextStyle(color: const Color(0xFF97AABD)),
        labelMedium: TextStyle(color: ColorsManager.secondaryColor),
        headlineMedium: TextStyle(color: ColorsManager.primary),
        headlineLarge: TextStyle(color: const Color(0xFFFFC10E)),
        labelLarge: TextStyle(color: ColorsManager.primaryColor),
      ),
      timePickerTheme: _timePickerTheme(),
      inputDecorationTheme: _inputDecorationTheme(),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.fuchsia: ZoomPageTransitionsBuilder(),
      }),
    );
  }

  static TimePickerThemeData _timePickerTheme() {
    return TimePickerThemeData(
      backgroundColor: Colors.white,
      hourMinuteShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      dayPeriodColor: _timePickerDayPeriodColor(),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      dayPeriodTextColor: _timePickerDayPeriodTextColor(),
      dayPeriodShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      hourMinuteColor: const Color(0xFFF6F6F6),
      hourMinuteTextColor: const Color(0xFF754C24),
      dialHandColor: const Color(0xFF754C24),
      dialBackgroundColor: const Color(0xFFF6F6F6),
      hourMinuteTextStyle:
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      dayPeriodTextStyle: const TextStyle(
          color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold),
      helpTextStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF797979)),
      inputDecorationTheme:
          const InputDecorationTheme(border: InputBorder.none),
      dialTextColor: const Color(0xFFFFFFFF),
      entryModeIconColor: const Color(0xFF754C24),
      confirmButtonStyle: _confirmButtonStyle(),
    );
  }

  static WidgetStateColor _timePickerDayPeriodColor() {
    return WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? const Color(0xFFFBB040)
            : Colors.white);
  }

  static WidgetStateColor _timePickerDayPeriodTextColor() {
    return WidgetStateColor.resolveWith((states) =>
        states.contains(WidgetState.selected)
            ? const Color(0xFF754C24)
            : const Color(0xFF797979));
  }

  static ButtonStyle _confirmButtonStyle() {
    return const ButtonStyle(
      padding: WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(vertical: 16, horizontal: 50),
      ),
      backgroundColor: WidgetStatePropertyAll<Color>(Color(0xFF754C24)),
      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
      ),
      textStyle: WidgetStatePropertyAll<TextStyle>(
        TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 14,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme() {
    return const InputDecorationTheme(
      isDense: true,
      disabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFD90505)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFFD90505)),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      contentPadding: EdgeInsets.only(right: 16, left: 10, top: 10, bottom: 10),
      errorStyle:
          TextStyle(color: Color(0xFFD90505), fontWeight: FontWeight.w700),
      hintStyle:
          TextStyle(color: Color(0xFFA6A6A6), fontWeight: FontWeight.w400),
    );
  }
}