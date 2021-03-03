import 'package:flutter/material.dart';

import '../../services/database.dart';

import '../../widgets/procedure.dart';
import '../../widgets/result_alert.dart';
import '../../widgets/missing_input.dart';

class WaterAbsorption extends StatelessWidget {
  final DatabaseService _database = DatabaseService();
  final data = {};

  void getValues(type, value) {
    try {
      data[type] = double.parse(value);
    } catch (e) {
      data[type] = null;
    }
  }

  void calculate(ctx) {
    final a = data['a'];
    final b = data['b'];

    if (a != null && b != null) {
      var answer = ((b - a) / a) * 100;
      var answerString = answer.toStringAsFixed(2) + '%';
      var answerText = 'Water Absorption = ' + answerString;
      showAlertDialog(ctx, 'Water Absorption of Coarse Aggregates', answerText);

      _database.addTest(
        testCategory: 'Coarse Aggregate',
        testName: 'Water Absorption',
        values: {
          'a': a,
          'b': b,
          'Water Absorption': answerString,
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
          title: Text('Water Absorption of Coarse Aggregates'),
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
                          '1. A sample of about 3000 gm of aggregates shall be taken and dried in a ventilated oven at 110° C for 24 hours. It should then be cooled and weighed accurately (Weight A)',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '2. The dried sample is then to be placed in a suitable container and covered with distilled water for 24 + ½ hours at a temperature of 22 to 32° C. Air bubbles on the surface of the aggregates shall be removed as then appear by gentle agitation with a rod.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '3. The sample will then be taken out of water and the surface water in the particles is removed by means of a damp cloth. The surface dried sample will then be immediately weight (Weight B)',
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
            margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 5),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Procedure(
                    procedure: 'Weight A',
                    getValues: getValues,
                    type: 'a',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Procedure(
                    procedure: 'Weight B',
                    getValues: getValues,
                    type: 'b',
                  ),
                  Container(
                    child: RaisedButton(
                      onPressed: () => calculate(context),
                      color: Theme.of(context).primaryColor,
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
