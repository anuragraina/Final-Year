import 'package:flutter/material.dart';

import '../../widgets/test_card.dart';

class MaterialTesting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Material Testing'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Test('Fine Aggregate'),
            Test('Coarse Aggregate'),
            Test('Water'),
            Test('Concrete'),
          ],
        ),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }
}
