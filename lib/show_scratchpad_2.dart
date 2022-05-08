import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void showScratchpad(BuildContext context) {
  print("showScratchpad activated");
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
                      return ListTile(
                        title: Text(scratchpad.contents[index]),
                      );
                    }
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