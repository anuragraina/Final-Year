import 'package:flutter/material.dart';

import '../../widgets/test_category.dart';

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
            TestCategory(name: 'Fine Aggregate', route: '/fine-aggregate'),
            TestCategory(name: 'Coarse Aggregate'),
            TestCategory(name: 'Water'),
            TestCategory(name: 'Concrete'),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
