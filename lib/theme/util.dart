import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme createTextTheme(
  BuildContext context,
  String bodyFontString,
  String displayFontString
) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;
  TextTheme bodyTextTheme = GoogleFonts.getTextTheme(bodyFontString, baseTextTheme);
  TextTheme displayTextTheme =
      GoogleFonts.getTextTheme(displayFontString, baseTextTheme);
  TextTheme textTheme = displayTextTheme.copyWith(
    titleMedium: TextStyle(
      fontSize: 20,
      fontFamily: displayTextTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.bold,
      height: 1.2,
      letterSpacing: 0.5
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontFamily: displayTextTheme.bodyLarge?.fontFamily,
      fontWeight: FontWeight.w700
    ),
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );
  return textTheme;
}
