import 'package:flame/collisions.dart';
import 'package:flame/collisions.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/palette.dart';
import 'package:flame/sprite.dart';
import 'package:flame_tiled/flame_tiled.dart';
import 'package:flutter/widgets.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'button_controller.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flame/geometry.dart';
import 'components/employee.dart';
import 'components/obstacles.dart';
import 'components/player.dart';
import 'helpers/joypad.dart';
import 'helpers/direction.dart';
import 'show_menu.dart' as sm;
//import 'show_text.dart';
//import 'show_text_2.dart';


final style = TextStyle(color: Colors.red);
final regular = TextPaint(style: style);

class MyGame extends FlameGame with HasCollisionDetection {
  //late Player player;
  Player player = Player();
  late double mapWidth;
  late double mapHeight;

  final double playerSpeed = 80;
  String soundTrackName = 'Bensound';
  int numChallengesCompleted = 0;

  @override
  Color backgroundColor() => const Color(0x00000000);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final homeMap = await TiledComponent.load(
        'floor_plan_1.tmx', Vector2.all(32.0));
    add(homeMap);

    mapWidth = homeMap.tileMap.map.width * 32.0;
    mapHeight = homeMap.tileMap.map.height * 32.0;

    add(TextComponent(text: 'Hello, Flame Helo, flame hello, falame', textRenderer: regular)
    //..anchor = Anchor.centerLeft
      ..position = Vector2(541, 864)
      ..x = 541
      ..y = 864);

    final employeeGroup = homeMap.tileMap.getObjectGroupFromLayer('Characters');
    final obstacleGroup = homeMap.tileMap.getObjectGroupFromLayer('Obstacles');

    for (final obj in obstacleGroup!.objects) {
      add(Obstacles(size: Vector2(obj.width, obj.height),
          position: Vector2(obj.x, obj.y)));
    }

    for (var employeeBox in employeeGroup.objects) {
      print("new employee being added: ");
      print(employeeBox.name);
      add(EmployeeComponent()
        ..name = employeeBox.name
        ..position = Vector2(employeeBox.x, employeeBox.y)
        ..width = employeeBox.width
        ..height = employeeBox.height
        ..debugMode = true);
    }

    FlameAudio.bgm.initialize();
    FlameAudio.audioCache.load('bensound-enigmatic.mp3');

    overlays.add('ButtonController');

    add(player);
    camera.followComponent(
        player, worldBounds: Rect.fromLTRB(0, 0, mapWidth, mapHeight));
  }

  void onJoypadDirectionChanged(Direction joypadDirection) {
    player.direction = joypadDirection;
  }

  void onActionButtonPressed() {
    print("action button pressed");
  }
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.fullScreen();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MyGame',
      home: MainGamePage(),
    );
  }
}

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  MyGame game = MyGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
      body: Stack(
        children: [
          GameWidget(
            game: game,
            overlayBuilderMap: {
              'ButtonController': (BuildContext context, MyGame game) {
                return ButtonController(
                  game: game,
                );
              }
            },
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child:
              Joypad(onDirectionChanged: game.onJoypadDirectionChanged),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child:
              FloatingActionButton(
                onPressed: () {
                  sm.showMenu(context);
                },
                backgroundColor: Colors.green,
                child: const Icon(Icons.navigation),
              ),
            ),
          ),
        ],
      ),
    );
  }
}