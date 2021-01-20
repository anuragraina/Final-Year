import 'package:flutter/material.dart';

import '../../widgets/test_category.dart';
import '../../services/auth.dart';

class MyHomePage extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Testing'),
        actions: <Widget>[
          FlatButton.icon(
            textColor: Colors.white,
            onPressed: () async {
              await _auth.logOut();
            },
            icon: Icon(Icons.person),
            label: Text(
              'Logout',
              style: TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TestCategory(name: 'New Test', route: '/material-testing'),
            TestCategory(
              name: 'Approved Tests',
              route: '/approved-tests',
            ),
            TestCategory(
              name: 'Pending Tests',
              route: '/pending-tests',
            ),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
