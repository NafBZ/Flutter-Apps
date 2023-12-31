import 'package:flutter/material.dart';
import 'package:budget_management/widgets/expenses.dart';
import 'package:google_fonts/google_fonts.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 47, 143, 162),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 41, 90, 142),
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    darkTheme: ThemeData.dark().copyWith(
      useMaterial3: true,
      colorScheme: kDarkColorScheme,
      cardTheme: const CardTheme(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            bodyMedium: GoogleFonts.lato(
              fontSize: 14,
              color: kDarkColorScheme.onPrimaryContainer,
            ),
            titleLarge: GoogleFonts.lato(
              fontSize: 18,
              color: kDarkColorScheme.onPrimaryContainer,
            ),
          ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.lato(
          fontSize: 14,
          color: kDarkColorScheme.onPrimaryContainer,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    theme: ThemeData().copyWith(
      useMaterial3: true,
      colorScheme: kColorScheme,
      appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer),
      cardTheme: const CardTheme(
        margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
            foregroundColor: kColorScheme.onPrimaryContainer),
      ),
      textTheme: ThemeData().textTheme.copyWith(
            bodyMedium: GoogleFonts.lato(
              fontSize: 14,
              color: kColorScheme.onPrimaryContainer,
            ),
            titleLarge: GoogleFonts.lato(
              fontSize: 18,
              color: kColorScheme.onPrimaryContainer,
            ),
          ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: GoogleFonts.lato(
          fontSize: 14,
          color: kColorScheme.onPrimaryContainer,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    themeMode: ThemeMode.system,
    home: const Expenses(),
  ));
}
