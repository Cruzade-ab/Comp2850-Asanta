import 'package:flame/game.dart';
import 'package:game/components/background_component.dart';

class GiftGrabGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(BackgroundComponent());
  }
}
