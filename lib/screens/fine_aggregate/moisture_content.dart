import 'package:flutter/material.dart';

import '../../services/database.dart';

import '../../widgets/procedure.dart';
import '../../widgets/result_alert.dart';
import '../../widgets/missing_input.dart';

class MoistureContent extends StatelessWidget {
  final DatabaseService _database = DatabaseService();
  final data = {};

  void getValues(type, value) {
    //add error handling
    data[type] = double.parse(value);
  }

  void calculateA(ctx) {
    final wc = data['wc'];
    final ws = data['ws'];
    final wm = data['wm'];
    final vd = data['vd'];

    if (wc != null && ws != null && wm != null && vd != null) {
      var vs = wc - wm + ws;
      var answer = (vs - vd) / (ws - vs);
      var answerString = answer.toStringAsFixed(2) + '%';
      var answerText = 'Percentage of surface moisture = ' + answerString;
      showAlertDialog(ctx, 'Moisture content', answerText);

      _database.addTest(
        testCategory: 'Fine Aggregate',
        testName: 'Moisture Content',
        values: {
          'wc': wc,
          'ws': ws,
          'wm': wm,
          'vd': vd,
          'Percentage of surface moisture': answerString
        },
      );
    } else {
      showAlertDialogMissingInput(ctx);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Moisture content of Fine Aggregates'),
        ),
        body: ListView(children: [
          Card(
            margin: EdgeInsets.all(20),
            child: ExpansionTile(
              title: Center(
                child: Text(
                  'PROCEDURE',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '1. One litre jar is taken and filled with water upto certain mark and weighed (say Wc )',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '2. Sample of sand (approximate 200 gm) is weighed in a balance (say Ws is the weight )',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '3. Sand sample is filled in the jar and the water is poured upto the previous mark. The jar is again weighed ( say Wm is the weight )',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '4. Weight of sample divided by specific gravity on SSD basis. (Vd)',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Procedure(
                    procedure: 'Wc gm',
                    getValues: getValues,
                    type: 'wc',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Procedure(
                    procedure: 'Ws gm',
                    getValues: getValues,
                    type: 'ws',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Procedure(
                    procedure: 'Wm gm',
                    getValues: getValues,
                    type: 'wm',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Procedure(
                    procedure: 'Vd',
                    getValues: getValues,
                    type: 'vd',
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () => calculateA(context),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    margin: EdgeInsets.only(top: 20),
                  )
                ],
              ),
            ),
          ),
        ]),
        backgroundColor: Theme.of(context).backgroundColor,
      ),
    );
  }
}
