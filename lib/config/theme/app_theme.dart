import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/constants/colors.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.bg,
    primaryColor: AppColors.hi,
    textTheme: TextTheme(
      displayLarge: GoogleFonts.roboto(
        fontSize: 64,
        fontWeight: FontWeight.bold,
        color: AppColors.ink,
        letterSpacing: -0.01,
      ),
      displayMedium: GoogleFonts.roboto(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColors.ink,
      ),
      headlineSmall: GoogleFonts.roboto(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.ink,
      ),
      bodyLarge: GoogleFonts.roboto(
        fontSize: 16,
        color: AppColors.ink2,
        height: 1.75,
      ),
      bodyMedium: GoogleFonts.roboto(fontSize: 14, color: AppColors.ink2),
      labelSmall: GoogleFonts.robotoMono(
        fontSize: 10,
        color: AppColors.ink3,
        letterSpacing: 0.15,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.bg,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.ink,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: AppColors.ink),
    ),
    cardTheme: CardThemeData(
      color: AppColors.card,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: const BorderSide(color: AppColors.border, width: 1),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.card,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.border2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.border2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.hi, width: 2),
      ),
      labelStyle: const TextStyle(color: AppColors.ink3),
      hintStyle: const TextStyle(color: AppColors.ink3),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.hi,
        foregroundColor: Colors.black,
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        elevation: 0,
        textStyle: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.08,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.ink2,
        side: const BorderSide(color: AppColors.border2),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        textStyle: GoogleFonts.roboto(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.08,
        ),
      ),
    ),
  );
}
