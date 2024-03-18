
import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Draggable;
import 'package:game/components/background_component.dart';
import 'package:game/components/santa_component.dart';
import 'package:game/inputs/joystick.dart';

class GiftGrabGame extends FlameGame with HasCollisionDetection, HasDraggables {
  // Added HasDraggables mixin
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackgroundComponent());
    add(SantaComponent(joystick: joystick));
    // Ensure your components like SantaComponent are draggable if needed
  }
}
