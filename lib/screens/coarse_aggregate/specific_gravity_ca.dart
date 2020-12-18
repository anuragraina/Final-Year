import 'package:flutter/material.dart';

import '../../widgets/procedure.dart';
import '../../widgets/result_alert.dart';

class SpecificGravityCA extends StatelessWidget {
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
        title: Text('Specific Gravity of Coarse Aggregates'),
      ),
      body: ListView(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'PROCEDURE',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '1. About one kg of sample is taken and thoroughly washed to remove fine particles of dust. It is then immersed in distilled water in the glass vessel and is kept for 24 + ½ hrs maintained at a temperature of 22o C to 32o C.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '2. The glass vessel is then given rapid clockwise and anti-clockwise rotation to remove any entrapped air or bubbles on the surface of the aggregates.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "3. Next the vessel is overfilled by adding more water and the plane ground glass disc is slid over the mouth, so as to ensure that no air is trapped in the vessel. The vessel is dried from outside and weighed. Let the weight be 'A'.",
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '4. The vessel is emptied and the aggregate allowed to drain. The vessel is refilled with water. The disc is slid, dried from outside and weighed. Let the weight be `B’.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '5. Next the aggregate is placed on a dry cloth and gently surface dried with the cloth and then transferred to a second dry cloth and it is spread out. The stones are allowed to dry in the atmosphere and kept away from direct sunlight or any other source of heat, till it dries (surface dry). The aggregate during the course of drying shall be turned at least once. Then the aggregate is weighed and let it be `C’.',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '6. Next the aggregate is placed in the tray and kept in the oven at a temperature of 100o C to 110o C for 24 + ½ hours. It is then cooled in airtight container and weighed. Let the weight be `D’.',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Procedure(
                    procedure: 'Weight of Vessel + Sample + Water = A gm',
                    getValues: getValues,
                    type: 'wc'),
                Procedure(
                    procedure: 'Weight of Vessel + Water = B gm', getValues: getValues, type: 'wc'),
                Procedure(
                    procedure: 'Weight of Saturated Surface Dry Sample = C gm',
                    getValues: getValues,
                    type: 'wc'),
                Procedure(
                    procedure: 'Weight of Oven Dry Sample = D gm',
                    getValues: getValues,
                    type: 'wc'),
                Center(
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {},
                      color: Colors.blue,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(5),
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // padding: const EdgeInsets.all(25),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
