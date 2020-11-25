import 'package:flutter/material.dart';

import './main_tests.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Test('Material Testing'),
            Test('Mix Design'),
          ],
        ),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }
}
