import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_1/show_challenges_menu.dart';
import 'package:game_1/show_monitor.dart';
import 'package:game_1/show_scratchpad.dart';

import 'main.dart';

void showMenu(BuildContext context, challenges) {
  const TextStyle text_style = TextStyle(color: Colors.black, fontSize: 18.0);
  
  showDialog(
    context: context,
    builder: (_) {
      return SimpleDialog(
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        children: [
          SimpleDialogOption(
            child: const Text('View Challenges', style: text_style),
            onPressed: () {
              showChallenges(context, challenges);
              print('You have selected to View Challenges');
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Show Scratchpad', style: text_style),
            onPressed: () {
              print('You have selected to Show Scratchpad');
              showScratchpad(context);
              print(scratchpad.contents);
              //Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Use USB Thumbdrive', style: text_style),
            onPressed: () {
              showMonitor(context);
              //DropDownMonitor monitor = DropDownMonitor();
              print('You have selected to use USB Thumbdrive');
              // Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Use Snifter', style: text_style),
            onPressed: () {
              // Do something
              print('You have selected to use Snifter');
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Close Menu', style: text_style),
            onPressed: () {
              // Do something
              print('You have selected to Close Menu');
              Navigator.of(context).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Quit Game', style: text_style),
            onPressed: () {
              // Do something
              print(scratchpad.contents.length);
              print('You have selected to Quit Game');
              Navigator.of(context).pop();
            },
          )
        ],
      );
    },
  );
}