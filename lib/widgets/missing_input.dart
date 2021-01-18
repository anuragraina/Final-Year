import 'package:flutter/material.dart';

showAlertDialogMissingInput(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Missing Input!"),
        content: Text("Please enter all the required values"),
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
