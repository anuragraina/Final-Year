import 'package:flutter/material.dart';

import '../../widgets/test_card.dart';

class FineAggregate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine Aggregate'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          TestCard(name: 'Gradation', route: '/fine-aggregate/gradation'),
          TestCard(name: 'Moisture content', route: '/fine-aggregate/moisture-content'),
          TestCard(name: 'Specific Gravity', route: '/fine-aggregate/specific-gravity'),
          TestCard(name: 'Silt Content', route: '/fine-aggregate/silt-content'),
          // TestCard(name: 'Deleterious material'),
          // TestCard(name: 'Organic impurity'),
          // TestCard(name: 'Soundness'),
          // TestCard(name: 'Alkali aggregate reactivity'),
          // TestCard(name: 'Chloride Content & Sulphate Content'),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
