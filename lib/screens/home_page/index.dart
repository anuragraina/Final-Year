import 'package:flutter/material.dart';

import '../../widgets/test_card.dart';

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
            TestCard(name: 'Material Testing', route: '/material-testing'),
            TestCard(name: 'Mix Design'),
          ],
        ),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }
}
