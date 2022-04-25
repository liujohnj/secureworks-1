import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_1/main.dart';
import '../show_dialog.dart' as sd;
import '../show_dialog.dart';

class EmployeeComponent extends PositionComponent with CollisionCallbacks, HasGameRef<MyGame> {
  //final MyGame game;
  EmployeeComponent() {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) async {
    print("Hit hit hit");
    var message = "Hello, you must be the new intern. My name is Alice. How are you?";
    DialogBox dialogBox = DialogBox(text: message, size: gameRef.size);
    gameRef.add(dialogBox);

    Future.delayed(Duration(seconds: 30), () {
      print("removing");
      gameRef.remove(dialogBox);
      print("removed");
    });
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    print('I made a contact');

    // var message = "Hello, you must be the new intern. My name is Alice. How are you?";
    // DialogBox dialogBox = DialogBox(text: message, size: gameRef.size);
    // gameRef.remove(dialogBox);
    gameRef.numChallengesCompleted++;
    gameRef.overlays.notifyListeners();
    // remove(this);  <-- this will remove bounding box
    super.onCollisionEnd(other);
  }
}