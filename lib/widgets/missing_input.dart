import 'package:flutter/material.dart';

showAlertDialogMissingInput(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Missing or incorrect Input!'),
        content: Text('Please check if all the inputs are entered and have numeric values.'),
        actions: [
          FlatButton(
            child: Text('OK'),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
