import 'package:flutter/material.dart';

class ConstantValues {
  static const String bannerAdUnitId = "ca-app-pub-7395420531513814/2774540483";
  static const String bannerAdTestUnitId = "ca-app-pub-3940256099942544/6300978111";

  static const String play = "Play";
  static const String playAgain = "Play Again";
  static const String settings = "Settings";
  static const String exit = "Exit";
  static const String gameName = "Angry Moles";
  static const String score = "Score:";
  static const String highScore = "High Score:";
  static const String time = "Time:";
  static const String yourScore = "Your Score";
  static const String themeMusic = "Theme Music";
  static const String sfx = "SFX";

  static const String keyHighScore = "highScore";
  static const String keyThemeMusicVolume = "themeMusicVolume";
  static const String keySfxVolume = "sfxVolume";

  static const double appBarElevation = 0.0;
  static const double positionedZero = 0.0;
  static const double padding = 8.0;
  static const int zero = 0;
  static const int rowCount = 4;
  static const int controllerDuration = 750;
  static const int waitDuration = 1000;
  static const int rndTimeMax = 5;

  static const List<List<double>> tileRange = [
    [0.0, 7.0],
    [12.0, 19.0],
    [8.0, 11.0],
    [20.0, 23.0],
  ];

  static double width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double titleFontSize(BuildContext context, int size) {
    double fontSize = 0;
    switch (size) {
      case 1:
        fontSize = Theme.of(context).textTheme.displayLarge!.fontSize!;
        break;
      case 2:
        fontSize = Theme.of(context).textTheme.displayMedium!.fontSize!;
        break;
      case 3:
        fontSize = Theme.of(context).textTheme.displaySmall!.fontSize!;
        break;
      case 4:
        fontSize = Theme.of(context).textTheme.headlineMedium!.fontSize!;
        break;
    }
    return fontSize;
  }

  static double scoreBoardFontSize(BuildContext context) {
    return Theme.of(context).textTheme.titleLarge!.fontSize!;
  }
}
