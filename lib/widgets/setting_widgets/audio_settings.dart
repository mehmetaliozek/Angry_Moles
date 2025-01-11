import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/custom_widgets/slider.dart';
import 'package:angry_moles/widgets/custom_widgets/text.dart';
import 'package:flutter/material.dart';

class AudioSettings extends StatelessWidget {
  const AudioSettings({
    super.key,
    required this.onChanged,
    required this.volume,
    required this.text,
  });
  final Function(double) onChanged;
  final double volume;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(ConstantValues.padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text,
            fontSize: ConstantValues.titleFontSize(context, 4),
          ),
          CustomSlider(
            onChanged: (vol) {
              onChanged(vol);
            },
            volume: volume,
          )
        ],
      ),
    );
  }
}
