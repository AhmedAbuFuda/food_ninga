import 'package:flutter/material.dart';

ThemeData appTheme(BuildContext context) {
  ThemeData themeData = ThemeData(
    fontFamily: 'BentonSansBook',
    scaffoldBackgroundColor: const Color(0xFFFFFFFF),
    primaryColor: const Color(0xff15BE77),
    textTheme: TextTheme(
      titleSmall: const TextStyle(
        fontFamily: 'Roboto',
        fontSize: 12.0,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(218, 99, 23, 1),
      ),
      labelSmall: const TextStyle(
        fontFamily: 'BentonSansBook',
        fontSize: 13.0,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(255, 124, 50, 1),
      ),
      labelMedium: const TextStyle(
        fontFamily: 'BentonSansRegular',
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(59, 59, 59, 1),
      ),
      titleLarge: const TextStyle(
        fontSize: 31.0,
        fontFamily: 'BentonSansBold',
        color: Color.fromRGBO(9, 5, 28, 1),
      ),
      titleMedium: const TextStyle(
        fontSize: 15.0,
        fontFamily: 'BentonSansMedium',
        fontWeight: FontWeight.w400,
        color: Color.fromRGBO(9, 5, 28, 1),
      ).apply(fontSizeFactor: 1),
    ).apply(fontSizeDelta: 0),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedButtonStyle(context),
    ),
  );

  return themeData;
}

ButtonStyle elevatedButtonStyle(
  BuildContext context, {
  EdgeInsetsDirectional? padding,
  Color? textColor,
  Color? backgroundColor,
  double? borderRadius,
  Color? borderColor,
  double? fontSize,
  FontWeight? fontWeight,
}) {
  return ButtonStyle(
      padding: WidgetStateProperty.all<EdgeInsetsDirectional>(
          padding ?? const EdgeInsetsDirectional.all(15)),
      foregroundColor:
          WidgetStateProperty.all<Color>(textColor ?? Colors.white),
      backgroundColor: WidgetStateProperty.all<Color>(
          backgroundColor ?? const Color(0xffff5291)),
      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8),
            side: BorderSide(color: borderColor ?? const Color(0xffff5291))),
      ),
      elevation: WidgetStateProperty.all<double>(0),
      textStyle: WidgetStateProperty.all<TextStyle>(
        const TextStyle(
          fontSize: 16.0,
          fontFamily: 'HankenLight',
          color: Colors.white,
        ).apply(fontSizeFactor: 1),
      ));
}
