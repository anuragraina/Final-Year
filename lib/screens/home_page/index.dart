import 'package:flutter/material.dart';

import '../../widgets/test_category.dart';

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
            TestCategory(name: 'Material Testing', route: '/material-testing'),
            TestCategory(name: 'Report'),
            TestCategory(name: 'Contact Us', route: '/contact-us'),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
