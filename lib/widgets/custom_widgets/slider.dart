import 'package:flutter/material.dart';

class CustomSlider extends StatelessWidget {
  const CustomSlider({
    super.key,
    required this.onChanged,
    required this.volume,
  });
  final Function(double) onChanged;
  final double volume;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: volume,
      onChanged: (vol) {
        onChanged(vol);
      },
    );
  }
}
