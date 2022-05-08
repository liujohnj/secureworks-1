import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showMonitor(BuildContext context) {
  print("show monitor");
  late String _value = 'username';
  late String value = 'username';
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text("Login", style: TextStyle(color: Colors.green)),
            backgroundColor: Colors.black,
            contentTextStyle: TextStyle(color: Colors.green),
            content: Column(
              children: <Widget>[
                DropdownButton(
                  value: _value,
                  items: <String>['Alice', 'Bob', 'Grace', 'Evan'].map<DropdownMenuItem<String>>((value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: _value = value as String
            ),
            Text("
            }Password"),
              ],
            ),
            actions: <Widget>[
              TextButton(
                  child: Text("Login", style: TextStyle(color: Colors.green)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }
              )
            ]
        );
      }
  );
}