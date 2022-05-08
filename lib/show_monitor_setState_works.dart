import 'package:flutter/material.dart';

void showMonitor(BuildContext context) {

  showDialog(
    context: context,
    builder: (context) {
      String contentText = "Content of Dialog";
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: Text("Title of Dialog"),
            content: Text(contentText),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    contentText = "Changed Content of Dialog";
                  });
                },
                child: Text("Change"),
              ),
            ],
          );
        },
      );
    },
  );
}