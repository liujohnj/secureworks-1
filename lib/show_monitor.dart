import 'package:flutter/material.dart';

void showMonitor(BuildContext context) {

  showDialog(
    context: context,
    builder: (context) {
      String dropdownValue = 'Alice';
      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0)
            ),
            insetPadding: EdgeInsets.all(10),
            title: Text(
                "Login Page",
                style: TextStyle(color: Colors.green, fontSize: 32.0)),
            backgroundColor: Colors.black,
            content: Column(
              children: <Widget>[
                Container(
                  width: 500,
                ),
                DropdownButton(
                  dropdownColor: Colors.black38,
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_downward, color: Colors.green),
                  elevation: 16,
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 24.0),
                  underline: Container(
                    height: 2,
                    color: Colors.green,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['Alice', 'Bob', 'Grace', 'Evan']
                      .map<DropdownMenuItem<String>>((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}