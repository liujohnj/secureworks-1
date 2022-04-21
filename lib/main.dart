import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'button_controller.dart';
import 'package:flame_audio/flame_audio.dart';


class MyWorld extends SpriteComponent {
  MyWorld() : super(size: Vector2(512, 544), anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('Office_Design_2.gif');
  }

  @override
  void onGameResize(Vector2 gameSize) {
    super.onGameResize(gameSize);
    position = gameSize / 2;
  }
}

class MyGame extends FlameGame with TapDetector {
  late SpriteAnimation rightAnimation;
  late SpriteAnimation upAnimation;
  late SpriteAnimation leftAnimation;
  late SpriteAnimation downAnimation;
  late SpriteAnimation idleAnimation;
  late SpriteAnimationComponent player;
  late SpriteComponent worldOffice;

  // 0=idle, 1=down, 2=left, 3=up, 4=down
  int direction = 0;
  final double animationSpeed = 0.25;
  final double playerSpeed = 80;
  String soundTrackName = 'Bensound';

  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void> onLoad() async {
    //await add(MyWorld());
    await super.onLoad();

    Sprite worldOfficeSprite = await loadSprite('Office_Design_2.gif');
    //Sprite worldOfficeSprite = await loadSprite('floor_plan_0.png');
    worldOffice = SpriteComponent()
      ..sprite = worldOfficeSprite
      ..size = worldOfficeSprite.originalSize;
    add(worldOffice);
    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('bensound-enigmatic.mp3');

    overlays.add('ButtonController');

    final spriteSheet = SpriteSheet(image: await images.load('Adam_run_16x16.png'), srcSize: Vector2(16, 32));

    rightAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 0, to: 6);
    upAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 6, to: 12);
    leftAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 12, to: 18);
    downAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 18, to: 24);
    idleAnimation = spriteSheet.createAnimation(row: 0, stepTime: animationSpeed, from: 18, to: 19);

    player = SpriteAnimationComponent()
      ..animation = downAnimation
      ..position = Vector2(0, 280)
      ..size = Vector2(32, 64);

    add(player);
    camera.followComponent(player, worldBounds: Rect.fromLTRB(0, 0, worldOffice.size.x, worldOffice.size.y));
  }

  @override
  void render(Canvas canvas) {
    super.render(canvas);
  }

  @override
  void update(double dt) {
    super.update(dt);
    switch (direction) {
      case 0:
        player.animation = idleAnimation;
        break;
      case 1:
        player.animation = rightAnimation;
        if (player.x < worldOffice.size.x - player.width * 2) {
          player.x += dt * playerSpeed;
        }
        break;
      case 2:
        player.animation = upAnimation;
        if (player.y > player.height * 2) {
          player.y -= dt * playerSpeed;
        }
        break;
      case 3:
        player.animation = leftAnimation;
        if (player.x > 0) {
          player.x -= dt * playerSpeed;
        }
        break;
      case 4:
        player.animation = downAnimation;
        if (player.y < worldOffice.size.y) {
          player.y += dt * playerSpeed;
        }
        break;
    }
  }

  @override
  void onTapUp(TapUpInfo info) {
    direction += 1;
    if (direction > 4) {
      direction = 0;
    }
    print('change animation up');
  }

}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();
  runApp(MaterialApp(
    home: Scaffold(
      body: GameWidget(
        game: MyGame(),
        overlayBuilderMap: {
          'ButtonController': (BuildContext context, MyGame game) {
            return ButtonController(
              game: game,
            );
          }
        },
      ),
    ),
  ));

  //GameWidget(game: myGame));
}