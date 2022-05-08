import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void showScratchpad(BuildContext context) {
  print("showScratchpad activated");
  print(scratchpad.contents.length);
  //var alice_values = scratchpad.credentials['Alice'];
  //var alice_pw = alice_values['pw'];
  print(scratchpad.credentials['Alice']);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Scratchpad'),
          backgroundColor: Colors.yellow,
          content: Container(
            width: double.minPositive,
            child: Scrollbar(
              isAlwaysShown: true,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: scratchpad.credentials.length,
                itemBuilder: (BuildContext context, int index) {
                  String key = scratchpad.credentials.keys.elementAt(index);
                  return Column(
                    children: <Widget>[
                      ListTile(
                        title: Text("${key}:"),
                        subtitle: Text("pw: ${scratchpad.credentials[key]['pw']}\n"
                            "hash: ${scratchpad.credentials[key]['hash']}\n"
                            "other: ${scratchpad.credentials[key]['other']}"),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              }
            )
          ]
        );
      }
  );
}