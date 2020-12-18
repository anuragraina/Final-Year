import 'package:flutter/material.dart';

import '../../widgets/procedure.dart';
import '../../widgets/result_alert.dart';

class SiltContent extends StatelessWidget {
  final data = {};

  void getValues(type, value) {
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
      var answerText = 'Percentage of surface moisture = ' + answer.toStringAsFixed(2) + '%';
      showAlertDialog(ctx, 'Moisture content', answerText);
    } else {
      print('missing');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Silt Content'),
      ),
      body: ListView(children: [
        Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  'PROCEDURE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                // SizedBox(
                //   height: 15,
                // ),
                Procedure(
                    procedure:
                        '5. Now note down the silt layer alone volume as V1 ml (settled over the sand)',
                    getValues: getValues,
                    type: 'wc'),
                Procedure(
                    procedure: '6. Then note down the sand volume (below the silt) as V2 ml',
                    getValues: getValues,
                    type: 'wc'),
                Container(
                  child: RaisedButton(
                    onPressed: () {},
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
    );
  }
}
