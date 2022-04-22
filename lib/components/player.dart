import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/sprite.dart';
import 'package:game_1/main.dart';

class PlayerComponent extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef {
  final MyGame game;
  PlayerComponent({required this.game}) {
    add(RectangleHitbox());
  }

  late SpriteAnimation rightAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimation idleAnimation;
  final double animationSpeed = 0.25;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final spriteSheet = SpriteSheet(
        image: await gameRef.images.load('Adam_run_16x16.png'),
        srcSize: Vector2(16, 32));

    // new
    rightAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 0, to: 6);
    upAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 6, to: 12);
    leftAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 12, to: 18);
    downAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 18, to: 24);
    idleAnimation =
        spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 18, to: 19);
    animation = idleAnimation;
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (game.direction) {
      case 0:
        animation = idleAnimation;
        break;
      case 1:
        animation = rightAnimation;
        if (x < game.mapWidth - width * 2) {
          x += dt * game.playerSpeed;
        }
        break;
      case 2:
        animation = upAnimation;
        if (y > height * 2) {
          y -= dt * game.playerSpeed;
        }
        break;
      case 3:
        animation = leftAnimation;
        if (x > 0) {
          x -= dt * game.playerSpeed;
        }
        break;
      case 4:
        animation = downAnimation;
        if (y < game.mapHeight - height * 1.5) {
          y += dt * game.playerSpeed;
        }
        break;
    }
    super.update(dt);
  }
}