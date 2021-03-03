import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../services/database.dart';

class ApprovedTests extends StatelessWidget {
  final DatabaseService _db = DatabaseService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Approved Tests'),
      ),
      body: StreamBuilder(
        stream: _db.getApprovedRecords(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          //add empty list widget
          return Padding(
            padding: EdgeInsets.all(10),
            child: ListView(
              children: snapshot.data.docs.map<Widget>((document) {
                final data = document.data();
                final time =
                    DateTime.fromMicrosecondsSinceEpoch(data['approved_on'].microsecondsSinceEpoch);

                data['approved_on'] = DateFormat('d MMM, yyyy – hh:mm aaa').format(time);

                return Card(
                  child: ListTile(
                    title: Text(data['test_name']),
                    subtitle: Text(data['test_category']),
                    trailing: Text(
                      data['approved_on'],
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                );
              }).toList(),
            ),
          );
        },
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
