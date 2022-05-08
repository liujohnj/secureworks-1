import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:game_1/show_challenge_compromise_park.dart';
import 'package:game_1/show_challenges_menu.dart';
import 'challenges.dart';

import 'main.dart';

void showChallenges(BuildContext ctx, challenges) {
  const colorChallengeText = Colors.black;

  showDialog(
    context: ctx,
    builder: (_) {


     String X_logout_laziness = "[  ]  ";
     String X_brute_raise = "[  ]  ";
     String X_sticky_note = "[  ]  ";
     String X_ripped_hash = "[  ]  ";
     String X_compromise_park = "[  ]  ";

     if (challenges.logout_laziness == true) {
       X_logout_laziness = "[X]  ";
     }


      return SimpleDialog(
        title: const Text('Menu', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.amber,
        children: [
          SimpleDialogOption(
            child: Text(X_logout_laziness + "Logout laziness (...more)", style: TextStyle(color: colorChallengeText)),
            onPressed: () {
              //showChallenges(ctx, challenges);
              print('Logout laziness');
              //Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_brute_raise + 'Be a brute & give yourself a raise (...more)', style: TextStyle(color: colorChallengeText)),
            onPressed: () {
              // Do something
              print('Brute force');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_sticky_note + 'Sticky note no-no (...more)', style: TextStyle(color: colorChallengeText)),
            onPressed: () {
              // Do something
              print('Sticky note');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_ripped_hash + 'Serve up John the Ripper some hash (...more)', style: TextStyle(color: colorChallengeText)),
            onPressed: () {
              // Do something
              print('John the Ripper');
              Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: Text(X_compromise_park + 'Compromise in the park (...more)', style: TextStyle(color: colorChallengeText)),
            onPressed: () {
              showChallengeCompromisePark(ctx);
              print('Compromise in the park');
              //Navigator.of(ctx).pop();
            },
          ),
          SimpleDialogOption(
            child: const Text('Close', style: TextStyle(color: colorChallengeText)),
            onPressed: () {
              // Do something
              print('You have selected to close');
              Navigator.of(ctx).pop();
            },
          )
        ],
      );
    },
  );
}