import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showChallengeCompromisePark(BuildContext context) {
  print("showChallengeCompromisePark activated");
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text("Alert!!"),
            content: Column(
              children: <Widget>[
                  Text("Blah blah blah"),
                  Text("Yada yada yada"),
                  Text("You have completed this challenge."),
              ],
            ),
            actions: <Widget>[
              new TextButton(
                  child: new Text("OK"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              )
            ]
        );
      }
  );
}