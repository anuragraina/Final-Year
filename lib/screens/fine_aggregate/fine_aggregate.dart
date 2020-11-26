import 'package:flutter/material.dart';

class FineAggregate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine Aggregate'),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: ListTile(
              title: Text(
                'Test',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            elevation: 5,
          ),
        ],
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
