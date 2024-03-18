import 'package:flame/components.dart';
import 'package:game/constants/globals.dart';
import 'package:game/gift_grab_game.dart';

enum MovementState {
  idle,
  slideLeft,
  slideRight,
}

class SantaComponent extends SpriteGroupComponent<MovementState> with HasGameRef<GiftGrabGame>{
  final double _spriteHeight = 200;
  final double _speed = 500;
  final JoystickComponent joystick;

  late double _rightBound;
  late double _leftBound;
  late double _upBound;
  late double _downBound;

  SantaComponent({required this.joystick});

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final Sprite santaIdle = await gameRef.loadSprite(Globals.santaIdleSprite);
    final Sprite santaSlideLeft =
        await gameRef.loadSprite(Globals.santaSlideLeftSprite);
    final Sprite santaSlideRight =
        await gameRef.loadSprite(Globals.santaSlideRightSprite);
    position = gameRef.size / 2;
    width = _spriteHeight * 1.42;
    height = _spriteHeight;
    anchor = Anchor.center;

    sprites = {
      MovementState.idle: santaIdle,
      MovementState.slideLeft: santaSlideLeft,
      MovementState.slideRight: santaSlideRight,
    };

    _rightBound = gameRef.size.x - 45;
    _leftBound = 0 + 45;
    _upBound = 0 + 55;
    _downBound = gameRef.size.y - 85;

    current = MovementState.idle;
  }

  @override
  void update(dt) {
    super.update(dt);

    if (joystick.direction == JoystickDirection.idle) {
      current = MovementState.idle;
      return;
    }

    if (x >= _rightBound) {
      x = _rightBound - 1;
    }

    if (x <= _leftBound) {
      x = _leftBound + 1;
    }

    if (y >= _downBound) {
      y = _downBound - 1;
    }

    if (y <= _upBound) {
      y = _upBound + 1;
    }

    bool movingLeft = joystick.relativeDelta[0] < 0;

    if (movingLeft) {
      current = MovementState.slideLeft;
    } else {
      current = MovementState.slideRight;
    }

    position.add(joystick.relativeDelta * _speed * dt);
  }
}
