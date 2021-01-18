import 'package:flutter/material.dart';

showAlertDialogWrongInput(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Output out of range!"),
        content: Text("Please re-check the values entered"),
        actions: [
          FlatButton(
            child: Text("OK"),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
