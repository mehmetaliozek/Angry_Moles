import 'package:angry_moles/widgets/background.dart';
import 'package:angry_moles/widgets/game_widgets/countdown.dart';
import 'package:angry_moles/widgets/game_widgets/game_over.dart';
import 'package:angry_moles/widgets/game_widgets/garden.dart';
import 'package:angry_moles/widgets/game_widgets/scoreboard.dart';
import 'package:flutter/material.dart';

class GamePage extends StatelessWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BackgroundWidget(
      appBarTitle: ScoreBoard(),
      child: Stack(
        children: [
          Garden(),
          Countdown(),
          GameOver(),
        ],
      ),
    );
  }
}
