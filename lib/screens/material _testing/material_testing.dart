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
            TestCard(name: 'Fine Aggregate'),
            TestCard(name: 'Coarse Aggregate'),
            TestCard(name: 'Water'),
            TestCard(name: 'Concrete'),
          ],
        ),
      ),
      backgroundColor: Colors.blue.shade50,
    );
  }
}
