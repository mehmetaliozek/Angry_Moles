import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/game_widgets/mole.dart';
import 'package:flutter/material.dart';

class Garden extends StatefulWidget {
  const Garden({super.key});

  @override
  State<Garden> createState() => _GardenState();
}

class _GardenState extends State<Garden> {
  late SliverGridDelegateWithFixedCrossAxisCount _sliverGridDelegate;
  final int _crossAxisCount = 4;

  @override
  void initState() {
    super.initState();
    _sliverGridDelegate = SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: _crossAxisCount,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: ConstantValues.width(context) /
            _sliverGridDelegate.crossAxisCount *
            ConstantValues.rowCount,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: _sliverGridDelegate,
          itemCount: ConstantValues.rowCount * _crossAxisCount,
          itemBuilder: (context, index) {
            return const Mole();
          },
        ),
      ),
    );
  }
}
