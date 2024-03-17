import 'package:flame/components.dart';
import 'package:game/gift_grab_game.dart';
import 'package:game/constants/globals.dart';

class BackgroundComponent extends SpriteComponent
       with HasGameRef<GiftGrabGame> {
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await gameRef.loadSprite(Globals.backgroundSprite);
    size = gameRef.size;
  }
}
