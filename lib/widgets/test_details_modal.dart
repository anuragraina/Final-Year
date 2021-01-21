import 'package:flutter/material.dart';

//import '../services/database.dart';

class ConfirmTestDetails extends StatefulWidget {
  final String testCategory;
  final String testName;
  final Map values;

  ConfirmTestDetails({this.testCategory, this.testName, this.values});

  @override
  _ConfirmTestDetailsState createState() => _ConfirmTestDetailsState();
}

class _ConfirmTestDetailsState extends State<ConfirmTestDetails> {
  String sampleUid;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: ListView(
        children: [
          Text(
            widget.testName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Row(
              children: [
                Text(
                  'Test Category: ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  widget.testCategory,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              'Values',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Table(
            border: TableBorder.all(),
            children: [
              for (var item in widget.values.keys)
                TableRow(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(item.toString())),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(child: Text(widget.values[item].toString())),
                    ),
                  ],
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                RaisedButton(
                  child: Text('Approve'),
                  onPressed: () {},
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

void getTestDetails({
  BuildContext context,
  String testCategory,
  String testName,
  Map values,
}) {
  //final DatabaseService _database = DatabaseService();

  // void _approveTest(BuildContext ctx, Map data) {
  //   //_database.addTest(data);
  //   Navigator.of(context).pop();
  // }

  showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (BuildContext context) {
        return ConfirmTestDetails(testCategory: testCategory, testName: testName, values: values);
      });
}
