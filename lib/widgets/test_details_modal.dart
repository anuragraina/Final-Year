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

  int _ddbValue = 1;

  DateTime selectedDate = DateTime.now();

  var _formKey = GlobalKey<FormState>();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      fieldHintText: 'Month/Date/Year',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

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
                        return 'Please enter sample source';
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter sample source',
                      errorStyle: TextStyle(fontSize: 15),
                    ),
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
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField(
                    value: _ddbValue,
                    items: [
                      DropdownMenuItem(
                        child: Text('First Item'),
                        value: 1,
                      ),
                      DropdownMenuItem(
                        child: Text('Second Item'),
                        value: 2,
                      ),
                      DropdownMenuItem(
                        child: Text('Third Item'),
                        value: 3,
                      ),
                      DropdownMenuItem(
                        child: Text('Fourth Item'),
                        value: 4,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _ddbValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    elevation: 2,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "${selectedDate.toLocal()}".split(' ')[0],
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(
                        width: 20.0,
                      ),
                      RaisedButton(
                        onPressed: () => _selectDate(context),
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
                  onPressed: () {
                    if (_formKey.currentState.validate()) {}
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
