import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void showLoginAttempt(BuildContext context, String username) {
  print("Login attempted");
  print(scratchpad.contents);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Login Attempt Status'),
            backgroundColor: Colors.grey,
            content: SingleChildScrollView(
              child: ListBody(
                children: const<Widget>[
                  Text('You do not have Alice\'s password.'),
                  Text('Would you like to attempt a brute force attack?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("Yes"),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              ),
              TextButton(
                child: const Text("No"),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              ),
            ],
        );
      }
  );
}