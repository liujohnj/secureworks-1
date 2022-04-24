import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'main.dart';

void showMenu(BuildContext ctx) {
  showDialog(
    context: ctx,
    builder: (_) {
      return SimpleDialog(
        title: const Text('Menu', style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.black,
        children: [
          SimpleDialogOption(
            child: const Text('View Challenges', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Do something
              print('You have selected to View Challenges');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Show Scratchpad', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Do something
              print('You have selected to Show Scratchpad');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Use USB Thumbdrive', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Do something
              print('You have selected to use USB Thumbdrive');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Use Snifter', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Do something
              print('You have selected to use Snifter');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Close Menu', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Do something
              print('You have selected to Close Menu');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Quit Game', style: TextStyle(color: Colors.green)),
            onPressed: () {
              // Do something
              print('You have selected to Quit Game');
              Navigator.of(ctx).pop();
            },
          )
        ],
      );
    },
  );
}