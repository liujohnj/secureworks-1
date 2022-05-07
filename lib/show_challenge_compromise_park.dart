import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showChallengeCompromisePark(BuildContext context) {
  print("showChallengeCompromisePark activated");
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: new Text("Alert!!"),
            content: new Text("You are awesome!"),
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