import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flutter/cupertino.dart';
import 'package:game_1/main.dart';
import '../show_conversation.dart' as sd;
import '../show_conversation.dart';


class EmployeeComponent extends PositionComponent with CollisionCallbacks, HasGameRef<MyGame> {
  //final MyGame game;
  bool in_dialog = false;
  bool alice_gone = false;
  late String name;
  late DialogBox dialogBox;

  EmployeeComponent() {
    add(RectangleHitbox());
  }

  @override
  void onCollisionStart(Set<Vector2> points, PositionComponent other) async {
    print("Collision with ${name}");
    print("Hit hit hit at ${points}");

    double x = points.first.x;
    double y = points.first.y;
    double x_offset = -points.first.x * 0.4;
    double y_offset = -175.0;
    print(other);
    late String message;

    if (in_dialog == false) {
      in_dialog = true;

      if (name == 'Alice') {
        if (alice_gone == false) {
          message = "Hello, you must be the new intern. My name is Alice. I can check "
              "you right in since I never get automatically logged out. The "
              "president is expecting you. Just to your right.";
        } else {
          message = "Hmmm ... Alice left her computer unattended and she never "
              "gets automatically logged out. Oh my gosh ... her calendar has the "
              "following event: \'Late night rendezvous tonight with Bob. "
              "Can't let his wife find out.\' Adding that to my Scratchpad.";
          challenges.logout_laziness = true;
          scratchpad.credentials['Alice']['other'] = 'Having affair with company president.';
          scratchpad.credentials['Bob']['other'] = 'Having affair with Alice.';
        }

      } else if (name == 'Bob') {
        message =
        "Welcome. I'm Bob. No one else at the company knows who you really are. Feel free "
            "to look for security vulnerabilities. I'm confident you won't find any. "
            "Go check in with Human Resources.";
      } else if (name == 'Craig') {
        message = "Hmm ... there's a sticky note right there on "
            "his desk with a long password written on it. I'll just add "
            "that password to my Scratchpad.";
        challenges.sticky_note = true;
        scratchpad.credentials['Craig']['pwd'] = 'n00neW1llevergue55this_p@ssw0rd';
      } else if (name == 'Grace') {
          message = "I'm Grace. I already have you in the system as an unpaid "
            "intern. Our I.T. director Craig is at a security conference but "
            "will be back tomorrow. He'll tell you to create a long password "
            "but I only use four lowercase letters. His is so long that "
            "he has to write it on a sticky note!";
          scratchpad.credentials['Grace']['other'] = 'Password is 4 lowercase letters.';
      } else if (name == 'Olivia') {
          message = "My name is Olivia. I am one of the other interns. The third "
              "intern, Eve, is probably out in the park where they have free public wifi.";
      } else if (name == 'Eve') {
          message = "Hi, I'm Eve. Isn't it a beautiful day? Don't mind me. I'm just "
            "taking advantage of the free public wifi to do some banking.";
      } else {
        message = "An open workstation. I think I'm going to log in.";
      }
      dialogBox = DialogBox(text: message, size: gameRef.size, position: Vector2(x + x_offset, y + y_offset));
      gameRef.add(dialogBox);
    }
  }

  @override
  void onCollisionEnd(PositionComponent other) {
    gameRef.remove(dialogBox);
    in_dialog = false;

    gameRef.numChallengesCompleted++;
    gameRef.overlays.notifyListeners();
    super.onCollisionEnd(other);
  }
}