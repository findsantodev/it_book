import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  final Color brandDark = const Color(0xFF181818);
  final Color brandRed = const Color(0xFFEE2737);

  final Color backgroundApp = const Color(0xFFF7F4F1);
  final Color backgroundLightest = const Color(0xFFFFFFFF);

  final Color borderBasic = const Color(0xFFBDBDBD);
  final Color borderDivider = const Color(0xFFE0E0E0);
  final Color borderDark = const Color(0xFF181818);

  final Color buttonPrimary = const Color(0xFFEE2737);
  final Color buttonTertiary = const Color(0xFFBDBDBD);

  final Color contentPrimary = const Color(0xFF181818);
  final Color contentSecondary = const Color(0xFF4F4F4F);
  final Color contentTertiary = const Color(0xFF828282);
  final Color contentInformative = const Color(0xFF5353D5);

  final List<Color> stateLoading = [
    const Color(0XFFA7A7A7),
    const Color(0XFFE7E7E7)
  ];

  final List<Color> circularProgress = [
    const Color(0xFF000000).withOpacity(0.3),
    const Color(0xFF000000)
  ];

  final MaterialColor mainCtaSwatch = const MaterialColor(0xFFF06161, {
    50: Color.fromRGBO(240, 97, 97, .1),
    100: Color.fromRGBO(240, 97, 97, .2),
    200: Color.fromRGBO(240, 97, 97, .3),
    300: Color.fromRGBO(240, 97, 97, .4),
    400: Color.fromRGBO(240, 97, 97, .5),
    500: Color.fromRGBO(240, 97, 97, .6),
    600: Color.fromRGBO(240, 97, 97, .7),
    700: Color.fromRGBO(240, 97, 97, .8),
    800: Color.fromRGBO(240, 97, 97, .9),
    900: Color.fromRGBO(240, 97, 97, 1),
  });
}

final AppTheme appTheme = AppTheme();

ThemeData getThemeData() {
  return ThemeData(
    scaffoldBackgroundColor: appTheme.backgroundApp,
    appBarTheme: AppBarTheme(color: appTheme.backgroundApp),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: appTheme.mainCtaSwatch,
    ).copyWith(secondary: appTheme.brandRed),
  );
}

extension CustomTheme on ThemeData {
  // Colors

  Color get brandDark => appTheme.brandDark;
  Color get brandRed => appTheme.brandRed;

  Color get backgroundApp => appTheme.backgroundApp;
  Color get backgroundLightest => appTheme.backgroundLightest;

  Color get borderBasic => appTheme.borderBasic;
  Color get borderDivider => appTheme.borderDivider;
  Color get borderDark => appTheme.borderDark;

  Color get buttonPrimary => appTheme.buttonPrimary;
  Color get buttonTertiary => appTheme.buttonTertiary;

  Color get contentPrimary => appTheme.contentPrimary;
  Color get contentSecondary => appTheme.contentSecondary;
  Color get contentTertiary => appTheme.contentTertiary;
  Color get contentInformative => appTheme.contentInformative;

  List<Color> get circularProgress => appTheme.circularProgress;

  // Text Styles
  TextStyle get display1 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 26,
        fontWeight: FontWeight.w700,
      );
  TextStyle get display2 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 24,
        fontWeight: FontWeight.w700,
      );
  TextStyle get display3 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w400,
      );
  TextStyle get display4 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      );

  TextStyle get heading1 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );
  TextStyle get heading2 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w500,
      );
  TextStyle get heading3 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      );
  TextStyle get heading4 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
  TextStyle get heading5 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 10,
        fontWeight: FontWeight.w700,
      );
  TextStyle get body1 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      );
  TextStyle get body2 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );
  TextStyle get body3 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w400,
      );
  TextStyle get body4 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w700,
      );
  TextStyle get body5 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      );
  TextStyle get body6 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 13,
        fontWeight: FontWeight.w400,
      );
  TextStyle get body7 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );

  TextStyle get caption1 => GoogleFonts.dmSans(
        color: contentSecondary,
        fontSize: 12,
        fontWeight: FontWeight.w700,
      );
  TextStyle get caption2 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );
  TextStyle get caption3 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 12,
        fontWeight: FontWeight.w400,
      );
  TextStyle get caption4 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 11,
        fontWeight: FontWeight.w500,
      );
  TextStyle get caption5 => GoogleFonts.dmSans(
        color: contentPrimary,
        fontSize: 11,
        fontWeight: FontWeight.w400,
      );

  TextStyle get primaryButton => GoogleFonts.dmSans(
        color: Colors.white,
        fontSize: 14,
        fontWeight: FontWeight.w700,
      );
}
