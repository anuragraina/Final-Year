import 'package:flutter/material.dart';

class GradationCA extends StatelessWidget {
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
          title: Text('Gradation of Coarse Aggregates'),
        ),
        body: Text('Hello world!'),
      ),
    );
  }
}
