import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:game_1/main.dart';

class EmployeeComponent extends PositionComponent with CollisionCallbacks {
  final MyGame game;
  EmployeeComponent({required this.game}) {
    add(RectangleHitbox());
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    print('I made a contact');
    game.numChallengesCompleted++;
    game.overlays.notifyListeners();
    // remove(this);  <-- this will remove bounding box
    super.onCollisionEnd(other);
  }
}