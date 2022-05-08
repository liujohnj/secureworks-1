import 'package:flutter/material.dart';

void showMonitor(BuildContext context) {
  StateSetter _setState;
  String _demoText = "test";

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  _setState = setState;
                  return Text(_demoText);
                }
            )
        );
      }
  );
}