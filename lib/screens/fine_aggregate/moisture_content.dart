import 'package:flutter/material.dart';

class MoistureContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moisture content of Fine Aggregates'),
      ),
      body: Text('Moisture content of Fine Aggregates'),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
