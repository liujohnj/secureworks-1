import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_1/main.dart';
import '../show_dialog.dart' as sd;
import '../show_dialog.dart';

class EmployeeComponent extends PositionComponent with CollisionCallbacks, HasGameRef<MyGame> {
  //final MyGame game;
  bool in_dialog = false;
  bool first_contact_alice = true;
  late String name;
  EmployeeComponent() {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) async {
    print(name);
    print("Hit hit hit");
    print(points);
    double x = points.first.x;
    double y = points.first.y;
    double x_offset = -100.0;
    double y_offset = -150.0;
    print(other);
    late String message;
    if (in_dialog == false) {
      in_dialog = true;
      if (name == 'Alice') {
        if (first_contact_alice == true) {
          message =
          "Hello, you must be the new intern. My name is Alice. How are you?";
          first_contact_alice = false;
        } else {
          message = "Back so soon? Have a great day!";
        }
      } else if (name == 'Bob') {
        message = "My name is Bob";
      }


      DialogBox dialogBox = DialogBox(text: message, size: gameRef.size, position: Vector2(x + x_offset, y + y_offset));
      gameRef.add(dialogBox);

      Future.delayed(Duration(seconds: 15), () {
        print("removing");
        gameRef.remove(dialogBox);
        print("removed");
        in_dialog = false;
      });
    }
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