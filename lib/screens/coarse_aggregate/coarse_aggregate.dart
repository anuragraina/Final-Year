import 'package:flutter/material.dart';

import '../../widgets/test_card.dart';

class CoarseAggregate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Coarse Aggregate'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 20),
        children: [
          TestCard(name: 'Petrographical analysis'),
          TestCard(name: 'Grading Analysis'),
          TestCard(name: 'Moisture content '),
          TestCard(name: 'Elongation Index and Flakiness Index'),
          TestCard(name: 'Deleterious material'),
          TestCard(name: 'Specific gravity', route: '/coarse-aggregate/specific-gravity'),
          TestCard(name: 'Water Absorption', route: '/coarse-aggregate/water-absorption'),
          TestCard(name: 'Organic impurity'),
          TestCard(name: 'Chloride Content & Sulphate Content'),
          TestCard(name: 'Alkali aggregate reactivity'),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
