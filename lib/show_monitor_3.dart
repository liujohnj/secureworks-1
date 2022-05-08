import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';


class Constants {
  static const String FirstItem = 'First Item';
  static const String SecondItem = 'Second Item';
  static const String ThirdItem = 'Third Item';

  static const List<String> choices = <String>[
    FirstItem,
    SecondItem,
    ThirdItem,
  ];

  String username = "Username";

  void changeUsername(newUsername) {
    username = newUsername;
  }

  void choiceAction(String choice) {
    if (choice == FirstItem) {
      print('I First Item');
    } else if (choice == SecondItem) {
      print('I Second Item');
    } else if (choice == ThirdItem) {
      print('I Third Item');
    }
    changeUsername(choice);
  }
}

void showMonitor(BuildContext context) {
  print("show monitor");
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Login", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.black,
        contentTextStyle: TextStyle(color: Colors.green),
        content: Column(
          children: <Widget>[
            PopupMenuButton<String>(
              child: Text(constants.username, style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              color: Colors.black45,
              onSelected: constants.choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice, style: TextStyle(color: Colors.green)),
                  );
                }).toList();
              },
            )
          ],
        ),
      );
    }
  );
}
