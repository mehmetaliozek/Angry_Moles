import 'package:angry_moles/classes/audios/theme_music.dart';
import 'package:angry_moles/classes/audios/sfx.dart';
import 'package:angry_moles/classes/paths.dart';
import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/classes/preferences.dart';
import 'package:angry_moles/classes/theme_colors.dart';
import 'package:angry_moles/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

// com.mehmetaliozek.angrymoles

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Preferences preferences = Preferences();
  MobileAds.instance.initialize();
  runApp(
    StateManager(
      preferences: preferences,
      themeMusic: ThemeMusic(preferences, assetPath: Paths.themeMusic()),
      sfx: SFX(preferences, assetPath: Paths.sfx()),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Angry Moles',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.varelaRoundTextTheme(),
        scaffoldBackgroundColor: ThemeColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: ThemeColors.appBarBackgroundColor,
          elevation: ConstantValues.appBarElevation,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(
              side: BorderSide(color: ThemeColors.borderColor),
            ),
            backgroundColor: ThemeColors.backgroundColor,
            textStyle: GoogleFonts.varelaRound(
              textStyle: Theme.of(context).textTheme.titleLarge,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        sliderTheme: const SliderThemeData(
          thumbColor: ThemeColors.backgroundColor,
          activeTrackColor: ThemeColors.backgroundColor,
        ),
      ),
      home: const HomePage(),
    );
  }
}
