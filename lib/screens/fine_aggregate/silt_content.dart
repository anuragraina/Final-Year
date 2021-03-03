import 'package:flutter/material.dart';

import '../../widgets/procedure.dart';
import '../../widgets/missing_input.dart';
import '../../widgets/test_details_modal.dart';

class SiltContent extends StatelessWidget {
  final data = {};

  void getValues(type, value) {
    try {
      data[type] = double.parse(value);
    } catch (e) {
      data[type] = null;
    }
  }

  void calculate(ctx) {
    final v1 = data['v1'];
    final v2 = data['v2'];

    if (v1 != null && v2 != null) {
      var answer = (v2 / v1) * 100;
      var answerString = answer.toStringAsFixed(2) + '%';

      getTestDetails(
        context: ctx,
        testCategory: 'Fine Aggregate',
        testName: 'Silt Content',
        values: {
          'v1': v1,
          'v2': v2,
          'Percentage of silt': answerString,
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
          title: Text('Silt Content'),
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
                          '1. First, we have to fill the measuring cylinder with 1% solution of salt and water up to 50 ml.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '2. Add sand to it until the level reaches 100 ml. Then fill the solution up to 150 ml level.',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '3. Cover the cylinder and shake it well and thoroughly for a while',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '4. After 3 hours, the silt content settled down over the sand layer',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '5. Now note down the silt layer alone volume as V1 ml (settled over the sand)',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          '6. Then note down the sand volume (below the silt) as V2 ml',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                )
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
                    procedure: 'V1 ml',
                    getValues: getValues,
                    type: 'v1',
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Procedure(
                    procedure: 'V2 ml',
                    getValues: getValues,
                    type: 'v2',
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
