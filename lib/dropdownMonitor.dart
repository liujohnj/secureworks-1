import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownMonitor extends StatefulWidget {
  @override
  _DropDownMonitorState createState() => _DropDownMonitorState();
}

class _DropDownMonitorState extends State<DropDownMonitor> {
  late String _value;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text("Login", style: TextStyle(color: Colors.green)),
        backgroundColor: Colors.black,
        contentTextStyle: TextStyle(color: Colors.green),
        content: Column(
          children: <Widget>[
            DropdownButton(
              value: _value,
              items: <String>['Alice', 'Bob', 'Grace', 'Evan'].map<
                  DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _value = value.toString();
                });
              },
            ),
            Text("Password"),
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
}