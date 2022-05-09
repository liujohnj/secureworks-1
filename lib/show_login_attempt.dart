import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void showLoginAttempt(BuildContext context, String username) {
  print("Login attempted");
  late bool has_pwd;
  late bool has_hash;
  scratchpad.credentials[username]['pwd'] == 'n/a'? has_pwd = false : has_pwd = true;
  scratchpad.credentials[username]['hash'] == 'n/a'? has_hash = false : has_hash = true;
  String other = scratchpad.credentials[username]['other'];
  print("${username} : ${has_pwd} : ${has_hash}");

  String text_string = '';
  String button_text = 'Close';

  if (has_pwd) {
    text_string = "You have ${username}\'s plain text password in your "
        "Scratchpad. Press Proceed button to log in as ${username}?";
    button_text = 'Proceed';
  } else if (has_hash) {
    text_string = "You have ${username}\'s encrypted, hashed password in your "
        "Scratchpad. Press Proceed button to run the John the Ripper password "
        "cracker to see if the hash appears in its dictionary?";
    button_text = 'Proceed';
  } else if (other == 'password is 4 lowercase letters') {
    text_string = "${username}\'s password is only 4 lowercase letters. Press "
        "Proceed button to attempt an automated brute force attack? There are only "
        "456,976 possible combinations. It should take not time at all.";
    button_text = 'Proceed';
  } else {
    text_string = "You do not have ${username}\'s plain password or hashed"
        "password.";
  };

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Login Attempt Status'),
            backgroundColor: Colors.white,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(text_string),
                  //Text('Would you like to attempt a brute force attack?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text(button_text),
                onPressed: () {
                  Navigator.of(context).pop();
                }
              ),
            ],
        );
      }
  );
}