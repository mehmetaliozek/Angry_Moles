import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/background.dart';
import 'package:angry_moles/widgets/custom_widgets/button.dart';
import 'package:angry_moles/screens/game_page.dart';
import 'package:angry_moles/screens/settings_page.dart';
import 'package:angry_moles/widgets/custom_widgets/text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomText(
                ConstantValues.gameName,
                fontSize: ConstantValues.titleFontSize(context, 2),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const GamePage(),
                      ),
                    );
                  },
                  text: ConstantValues.play,
                ),
                CustomButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                  text: ConstantValues.settings,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
