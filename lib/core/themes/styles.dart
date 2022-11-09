import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presentation/common_widgets/constants.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      // colorSchemeSeed: const Color.fromRGBO(5, 70, 123, 1),
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromRGBO(5, 70, 123, 1),
        //! Color for Search Row Container
        primaryContainer:
            isDarkTheme ? Constants.secondaryGray1 : Constants.primaryGray1,
        //! Color for Primary Text
        primary: isDarkTheme
            ? Constants.secondaryTextColor
            : Constants.primaryTextColor,
        //! Color for Explore Logo
        secondary:
            isDarkTheme ? Constants.secondaryExplore : Constants.primaryExplore,
        //! Color for Icons
        onSecondary: isDarkTheme
            ? Constants.secondaryIconColor
            : Constants.primaryIconColor,
        //!Color for Sub Texts
        tertiary: isDarkTheme
            ? Constants.secondarySubTextColor
            : Constants.primarySubTextColor,
        onPrimaryContainer:
            isDarkTheme ? Colors.white54 : Color.fromARGB(255, 17, 60, 95),
        inversePrimary: isDarkTheme ? Colors.white : Colors.black,
      ),
      scaffoldBackgroundColor:
          isDarkTheme ? Constants.secondaryBlack : Constants.primaryWhite,
      textTheme: GoogleFonts.rubikTextTheme(Theme.of(context).textTheme),
      iconTheme: IconThemeData(
          color: isDarkTheme
              ? Constants.secondaryIconColor
              : Constants.primaryIconColor),
      unselectedWidgetColor: isDarkTheme ? Colors.grey : Colors.grey.shade300,
      // primaryColor: isDarkTheme ? Colors.white : Color.fromRGBO(5, 70, 123, 1),
      backgroundColor: isDarkTheme ? Colors.black : const Color(0xffF1F5FB),
      indicatorColor: isDarkTheme
          ? const Color.fromRGBO(5, 70, 123, 1)
          : const Color(0xffCBDCF8),
      hintColor:
          isDarkTheme ? const Color(0xff280C0B) : const Color(0xffEECED3),
      highlightColor: isDarkTheme
          ? const Color(0xff372901)
          : Color.fromARGB(185, 121, 165, 209),
      hoverColor:
          isDarkTheme ? const Color(0xff3A3A3B) : const Color(0xff4285F4),
      focusColor:
          isDarkTheme ? const Color(0xff0B2512) : const Color(0xffA8DAB5),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      // brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
      ),
    );
  }
}
