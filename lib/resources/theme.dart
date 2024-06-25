import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  final Color brandDark = const Color(0xFF181818);
  final Color brandLight = const Color(0xFFF7F4F1);
  final Color brandRed = const Color(0xFFEE2737);
  final Color brand1 = const Color(0xFFF8D340);
  final Color brand2 = const Color(0xFFFB8F10);
  final Color brand3 = const Color(0xFF5353D5);
  final Color brand4 = const Color(0xFF3F3832);

  final Color createdTagBg = const Color(0xFFF8D340);
  final Color pendingTagBg = const Color(0xFFFB8F10);
  final Color approvedTagBg = const Color(0xFF5353D5);
  final Color rejectedTagBg = const Color(0xFFEE2737);
  final Color receivedTagBg = const Color(0xFF3F3832);

  final Color arrivedTagBg = const Color(0xFF5353D5);
  final Color deliveredTagBg = const Color(0xFF3F3832);
  final Color cancelledTagBg = const Color(0xFF637074);

  final Color contentRedBg = const Color(0xFFEE2737);

  final Color backgroundNegative200 = const Color(0xFFFCD4D7);
  final Color backgroundWarning200 = const Color(0xFFFEEEDB);
  final Color backgroundWarning300 = const Color(0xFFFEDDB7);
  final Color backgroundInformative200 = const Color(0xFFDDDDF7);
  final Color backgroundApp = const Color(0xFFF7F4F1);
  final Color backgroundLightest = const Color(0xFFFFFFFF);
  final Color backgroundDark100 = const Color(0xFF181818).withOpacity(0.1);
  final Color backgroundDark200 = const Color(0xFF181818).withOpacity(0.2);
  final Color backgroundDark500 = const Color(0xFF181818).withOpacity(0.5);
  final Color backgroundDark800 = const Color(0xFF181818).withOpacity(0.8);
  final Color backgroundInactive200 = const Color(0xFFD1D1D1);

  final Color boxShadow = const Color(0xFF181818);
  final Color boxShading = const Color(0xFFF7F4F1);

  final Color borderNegative500 = const Color(0xFFEE2737);
  final Color borderWarning500 = const Color(0xFFFB8F10);
  final Color borderInformative500 = const Color(0xFF5353D5);
  final Color borderBasic = const Color(0xFFBDBDBD);
  final Color borderDivider = const Color(0xFFE0E0E0);
  final Color borderStateSelected = const Color(0xFFEE2737);
  final Color borderStateNotSelected = const Color(0xFFBDBDBD);
  final Color borderFocused = const Color(0xFF5353D5);
  final Color borderStateNotFocused = const Color(0xFFE0E0E0);
  final Color borderDark = const Color(0xFF181818);

  final Color buttonPrimary = const Color(0xFFEE2737);
  final Color buttonSecondary = const Color(0xFF181818);
  final Color buttonTertiary = const Color(0xFFBDBDBD);
  final Color buttonLink = const Color(0xFF5353D5);
  final Color buttonOnColor = const Color(0xFFFFFFFF);
  final Color buttonStateDisabled = const Color(0xFFBDBDBD);
  final Color buttonIconLight = const Color(0xFFA0A0A0);
  final Color buttonIconDark = const Color(0xFF181818);

  final Color contentPrimary = const Color(0xFF181818);
  final Color contentSecondary = const Color(0xFF4F4F4F);
  final Color contentTertiary = const Color(0xFF828282);
  final Color contentPlaceholder = const Color(0xFFA0A0A0);
  final Color contentOnColor = const Color(0xFFFFFFFF);
  final Color contentNegative = const Color(0xFFEE2737);
  final Color contentInformative = const Color(0xFF5353D5);
  final Color contentPositive = const Color(0xFF181818);
  final Color contentProminent = const Color(0xFFEE2737);

  final Color stateActive = const Color(0xFF5EC14F);
  final Color stateInactive = const Color(0xFF181818);

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
  Color get brandLight => appTheme.brandLight;
  Color get brandRed => appTheme.brandRed;
  Color get brand1 => appTheme.brand1;
  Color get brand2 => appTheme.brand2;
  Color get brand3 => appTheme.brand3;
  Color get brand4 => appTheme.brand4;

  Color get createdTagBg => appTheme.createdTagBg;
  Color get pendingTagBg => appTheme.pendingTagBg;
  Color get approvedTagBg => appTheme.approvedTagBg;
  Color get rejectedTagBg => appTheme.rejectedTagBg;
  Color get receivedTagBg => appTheme.receivedTagBg;

  Color get arrivedTagBg => appTheme.arrivedTagBg;
  Color get deliveredTagBg => appTheme.deliveredTagBg;
  Color get cancelledTagBg => appTheme.cancelledTagBg;

  Color get contentRedBg => appTheme.contentRedBg;

  Color get backgroundNegative200 => appTheme.backgroundNegative200;
  Color get backgroundWarning200 => appTheme.backgroundWarning200;
  Color get backgroundWarning300 => appTheme.backgroundWarning300;
  Color get backgroundInformative200 => appTheme.backgroundInformative200;
  Color get backgroundApp => appTheme.backgroundApp;
  Color get backgroundLightest => appTheme.backgroundLightest;
  Color get backgroundDark100 => appTheme.backgroundDark100;
  Color get backgroundDark200 => appTheme.backgroundDark200;
  Color get backgroundDark500 => appTheme.backgroundDark500;
  Color get backgroundDark800 => appTheme.backgroundDark800;
  Color get backgroundInactive200 => appTheme.backgroundInactive200;

  Color get boxShadow => appTheme.boxShadow;
  Color get boxShading => appTheme.boxShading;

  Color get borderNegative500 => appTheme.borderNegative500;
  Color get borderWarning500 => appTheme.borderWarning500;
  Color get borderInformative500 => appTheme.borderInformative500;
  Color get borderBasic => appTheme.borderBasic;
  Color get borderDivider => appTheme.borderDivider;
  Color get borderStateSelected => appTheme.borderStateSelected;
  Color get borderStateNotSelected => appTheme.borderStateNotSelected;
  Color get borderFocused => appTheme.borderFocused;
  Color get borderStateNotFocused => appTheme.borderStateNotFocused;
  Color get borderDark => appTheme.borderDark;

  Color get buttonPrimary => appTheme.buttonPrimary;
  Color get buttonSecondary => appTheme.buttonSecondary;
  Color get buttonTertiary => appTheme.buttonTertiary;
  Color get buttonLink => appTheme.buttonLink;
  Color get buttonOnColor => appTheme.buttonOnColor;
  Color get buttonStateDisabled => appTheme.buttonStateDisabled;
  Color get buttonIconLight => appTheme.buttonIconLight;
  Color get buttonIconDark => appTheme.buttonIconDark;

  Color get contentPrimary => appTheme.contentPrimary;
  Color get contentSecondary => appTheme.contentSecondary;
  Color get contentTertiary => appTheme.contentTertiary;
  Color get contentPlaceholder => appTheme.contentPlaceholder;
  Color get contentOnColor => appTheme.contentOnColor;
  Color get contentNegative => appTheme.contentNegative;
  Color get contentInformative => appTheme.contentInformative;
  Color get contentPositive => appTheme.contentPositive;
  Color get contentProminent => appTheme.contentProminent;

  Color get stateActive => appTheme.stateActive;
  Color get stateInactive => appTheme.stateInactive;

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
