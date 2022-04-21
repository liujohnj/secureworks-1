import 'package:flutter/material.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game_1/main.dart';

class ButtonController extends StatelessWidget {
  final MyGame game;
  const ButtonController({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.volume_up_rounded),
          color: Colors.pink.shade200,
          onPressed: () {
            FlameAudio.bgm.play('bensound-enigmatic.mp3');
          },
        ),

        IconButton(
          icon: const Icon(Icons.volume_off_rounded),
          color: Colors.pink.shade200,
          onPressed: () {
            FlameAudio.bgm.stop();
          },
        ),
        Text(
          game.soundTrackName,
          style: TextStyle(color: Colors.pink.shade200, fontSize: 20),
        ),
      ],
    );
  }
}

