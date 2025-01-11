import 'dart:async';
import 'dart:math';

import 'package:angry_moles/classes/paths.dart';
import 'package:angry_moles/state_manage/state_manager.dart';
import 'package:angry_moles/classes/constant_values.dart';
import 'package:angry_moles/widgets/game_widgets/mole.dart';
import 'package:flutter/material.dart';

abstract class MoleStateModel extends State<Mole> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _tile;

  late Timer _timer;

  late int _number = 0;
  int _rndTime = 0;
  int _rndIndex = 0;

  late bool _isClickable;
  bool _isTap = false;
  bool _isClosed = false;

  @override
  void initState() {
    super.initState();

    _timer = Timer(const Duration(seconds: 0), () {});

    _controller = AnimationController(vsync: this);

    _animation(_addListener);
  }

  @override
  void dispose() {
    _isClosed = !_isClosed;
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _addListener() {
    _controller.addListener(
      () => StateManager.of(context)!.getTime() != 0 ? _setNumber((_tile.value as double).toInt()) : _setNumber(0),
    );
  }

  void _animation(Function listener) {
    _isClickable = true;
    _rndTime = Random().nextInt(ConstantValues.rndTimeMax) + ConstantValues.rndTimeMax;
    Future.delayed(Duration(seconds: _rndTime), () {
      if (!_isClosed) {
        _digAnimation();

        listener();
      }
    });
  }

  // Köstebeğin yeraltından yüzeye çıkış animasyonu
  void _digAnimation() {
    if (_isTap) {
      _isTap = !_isTap;
    }

    _controller.duration = const Duration(
      milliseconds: ConstantValues.controllerDuration,
    );
    _rndIndex = Random().nextInt(2);
    _setAnimation(_rndIndex);

    // Animasyon bittikten sonra bekleme süresince widget a tıklanmazsa geri dönüş animasyonu başlar
    _controller
        .forward()
        .whenComplete(
          () => _timer = Timer(
            const Duration(milliseconds: ConstantValues.waitDuration),
            () => _reverseDigAnimation(),
          ),
        )
        .whenComplete(() => _animation(() {}));
  }

  // Köstebeğin yüzeyden yeraltına giriş animasyonu
  void _reverseDigAnimation() {
    // Widget ı tıklanamaz yapar
    _isClickable = !_isClickable;

    // animasyon bittikten sonra widget ı tıklanabilir hale getirir
    if (!_isClosed) {
      _controller.reverse();
    }
  }

  // Köstebeğe tıkladığımızda hasar alma animasyonu
  void hurtAnimation() {
    _controller.duration = const Duration(
      milliseconds: ConstantValues.controllerDuration ~/ 2.0,
    );
    _setAnimation(_rndIndex + 2);

    // animasyon bittikten sonra yeraltına dönüş animasyonunu çağırır
    if (!_isClosed) {
      StateManager.of(context)!.sfx.play(StateManager.of(context)!.sfx.sfx);
      _setScore();
      _controller.forward().whenComplete(() {
        StateManager.of(context)!.sfx.stop(StateManager.of(context)!.sfx.sfx);
        StateManager.of(context)!.sfx.setAsset(
              StateManager.of(context)!.sfx.sfx,
              Paths.sfx(),
            );
      });
    }
  }

  // Animasyonlar çalışmadan önce controller ın resetlenenir ve sıradaki resimlerin seçilir
  void _setAnimation(int index) {
    _controller.reset();

    _setTile(
      begin: ConstantValues.tileRange[index][0],
      end: ConstantValues.tileRange[index][1],
    );
  }

  // Animasyonda kullanıcak olan sıradaki resmin numarasını şimdikiyle değiştirir
  void _setNumber(int nextNumber) => setState(
        () => _number = nextNumber,
      );

  // Animasyonun hangi aralıktaki resimleri kullancağının belirler
  void _setTile({required double begin, required double end}) => _tile = Tween(begin: begin, end: end).animate(_controller);

  void _setScore() {
    StateManager.of(context)!.setScore(
      StateManager.of(context)!.getScore() + (_rndIndex == 0 ? 5 : -10),
    );
    if (StateManager.of(context)!.getScore() >= StateManager.of(context)!.getHighScore()) {
      StateManager.of(context)!.setHighScore(StateManager.of(context)!.getScore());
    }
  }

  int getNumber() => _number;

  bool getIsTap() => _isTap;

  void setIsTap() {
    setState(() {
      _isTap = !_isTap;
    });
  }

  bool getIsClickable() => _isClickable;

  void timerCancel() => _timer.cancel();
}
