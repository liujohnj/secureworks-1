import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void showScratchpad(BuildContext context) {
  print("showScratchpad activated");
  print(scratchpad.contents.length);

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: Text('Scratchpad'),
            backgroundColor: Colors.yellow,
            content: Container(
              width: double.minPositive,
              child:
                Scrollbar(
                  isAlwaysShown: true,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: scratchpad.contents.length,
                    itemBuilder: (BuildContext context, int index) {
                      String key = scratchpad.contents.keys.elementAt(index);
                      return Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("${key}:"),
                            subtitle: Text("${scratchpad.contents[key]}"),
                          ),
                          /*
                          Divider(
                            height: 1.0,
                          ),
                           */
                        ],
                      );
                    },
                  )
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