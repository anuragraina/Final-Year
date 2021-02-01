import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../services/database.dart';

class ConfirmTestDetails extends StatefulWidget {
  final String testCategory;
  final String testName;
  final Map values;

  ConfirmTestDetails({this.testCategory, this.testName, this.values});

  @override
  _ConfirmTestDetailsState createState() => _ConfirmTestDetailsState();
}

class _ConfirmTestDetailsState extends State<ConfirmTestDetails> {
  DatabaseService _db = DatabaseService();
  String sampleUid;
  String sampleSource;
  String sampleType;
  String selectedSite;

  DateTime dateOfReceipt = DateTime.now();
  DateTime dateOfTesting = DateTime.now();

  var _formKey = GlobalKey<FormState>();

  _selectDateOfReceipt(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateOfReceipt, // Refer step 1
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null && picked != dateOfReceipt) {
      print(picked);
      setState(() {
        dateOfReceipt = picked;
      });
    }
  }

  _selectDateOfTesting(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateOfTesting, // Refer step 1
      firstDate: DateTime.now().subtract(new Duration(days: 7)),
      lastDate: DateTime.now(),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null && picked != dateOfTesting)
      setState(() {
        dateOfTesting = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    ProgressDialog pr = ProgressDialog(context);
    pr = ProgressDialog(
      context,
      type: ProgressDialogType.Normal,
      isDismissible: true,

      /// your body here
      customBody: LinearProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
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
                    fontSize: 18,
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
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                children: [
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter sample UID';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter sample UID',
                      errorStyle: TextStyle(fontSize: 15),
                    ),
                    onChanged: (value) {
                      setState(() => sampleUid = value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter sample source';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter sample source',
                      errorStyle: TextStyle(fontSize: 15),
                    ),
                    onChanged: (value) {
                      setState(() => sampleSource = value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Please enter sample type';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter sample type',
                      errorStyle: TextStyle(fontSize: 15),
                    ),
                    onChanged: (value) {
                      setState(() => sampleType = value);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StreamBuilder(
                    stream: _db.getSites(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }

                      List<DropdownMenuItem> sites = [];

                      if (!snapshot.hasData) {
                        return Text('Loading..');
                      } else {
                        for (QueryDocumentSnapshot document in snapshot.data.docs) {
                          final site = document.data();
                          sites.add(
                            DropdownMenuItem(
                              child: Text(site['site_name']),
                              value: "${document.id}",
                            ),
                          );
                        }

                        return DropdownButtonFormField(
                          items: sites,
                          onChanged: (clickedSite) {
                            setState(() {
                              selectedSite = clickedSite;
                            });
                          },
                          value: selectedSite,
                          hint: Text('Select Site'),
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Date of receipt',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDateOfReceipt(context),
                        child: Text(
                          'Select date',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Date of testing',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDateOfTesting(context),
                        child: Text(
                          'Select date',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(side: BorderSide(color: Colors.black)),
                      ),
                    ],
                  )
                ],
              ),
            ),
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
                  child: Text('Send for Approval'),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      await pr.show();
                      await _db.addTest(
                        testCategory: widget.testCategory,
                        testName: widget.testName,
                        values: widget.values,
                        sampleUid: sampleUid,
                        sampleSource: sampleSource,
                        sampleType: sampleType,
                        selectedSite: selectedSite,
                        dateOfReceipt: dateOfReceipt,
                        dateOfTesting: dateOfTesting,
                      );
                      await pr.hide();
                      Navigator.of(context).pop();
                    }
                  },
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
