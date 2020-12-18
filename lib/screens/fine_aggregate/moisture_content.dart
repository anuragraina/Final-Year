import 'package:flutter/material.dart';

import '../../widgets/procedure.dart';

class MoistureContent extends StatelessWidget {
  final data = {};

  void getValues(type, value) {
    data[type] = double.parse(value);
  }

  void calculateA() {
    final wc = data['wc'];
    final ws = data['ws'];
    final wm = data['wm'];
    final vd = data['vd'];

    if (wc != null && ws != null && wm != null && vd != null) {
      var vs = wc - wm + ws;
      var answer = (vs - vd) / (ws - vs);
      print(answer);
    } else {
      print('missing');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Moisture content of Fine Aggregates'),
      ),
      body: ListView(children: [
        Card(
          margin: EdgeInsets.all(20),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  'METHOD - A',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                Procedure(
                    procedure:
                        '1. One litre jar is taken and filled with water upto certain mark and weighed (say Wc )',
                    getValues: getValues,
                    type: 'wc'),
                Procedure(
                    procedure:
                        '2. Sample of sand (approximate 200 gm) is weighed in a balance (say Ws is the weight )',
                    getValues: getValues,
                    type: 'ws'),
                Procedure(
                    procedure:
                        '3. Sand sample is filled in the jar and the water is poured upto the previous mark. The jar is again weighed ( say Wm is the weight )',
                    getValues: getValues,
                    type: 'wm'),
                Procedure(
                    procedure: '4. Weight of sample divided by specific gravity on SSD basis. (Vd)',
                    getValues: getValues,
                    type: 'vd'),
                Container(
                  child: RaisedButton(
                    onPressed: calculateA,
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
    );
  }
}
