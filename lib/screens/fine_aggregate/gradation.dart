import 'package:flutter/material.dart';

class Gradation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Gradation of Fine Aggregates'),
        ),
        body: Text('Hello world!'),
      ),
    );
  }
}
