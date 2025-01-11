import 'package:angry_moles/ad/ad.dart';
import 'package:angry_moles/classes/paths.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    Key? key,
    required this.child,
    this.appBarTitle,
  }) : super(key: key);
  final Widget child;
  final Widget? appBarTitle;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: SafeArea(
            child: Container(
              height: ConstantValues.height(context),
              width: ConstantValues.width(context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Paths.background()),
                  fit: BoxFit.cover,
                ),
              ),
              child: child,
            ),
          ),
        ),
        Positioned(
          top: ConstantValues.positionedZero,
          left: ConstantValues.positionedZero,
          right: ConstantValues.positionedZero,
          child: AppBar(
            title: appBarTitle ?? const SizedBox.shrink(),
            automaticallyImplyLeading: false,
          ),
        ),
        const Positioned(
          bottom: ConstantValues.positionedZero,
          left: ConstantValues.positionedZero,
          right: ConstantValues.positionedZero,
          child: BannerAdWidget()
        ),

      ],
    );
  }
}
