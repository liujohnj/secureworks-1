import 'dart:ui';
import 'package:flame/components.dart';

class DialogBox extends TextBoxComponent with HasGameRef {
  DialogBox({required String text, required Vector2 size}) : super (
    text: text,
    //position: size,
    position: Vector2(541, 864),
    boxConfig: TextBoxConfig(dismissDelay: 5.0, maxWidth: size.x * 0.5, timePerChar: 0.1,)
  ) {
    //anchor = Anchor.centerRight;
    //anchor = Anchor.Vector2(541,864);
  }

  @override
  void drawBackground(Canvas c) {
    Rect rect = Rect.fromLTWH(0, 0, width, height);
    c.drawRect(rect, Paint()..color = const Color(0x8f37474f));
  }

  /*
  @override
  void update(double dt) {
    super.update(dt);
    if (finished) {
      gameRef.remove(this);
    }
  }
  */
}