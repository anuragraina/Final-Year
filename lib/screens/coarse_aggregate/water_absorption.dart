import 'package:flutter/material.dart';

import '../../widgets/procedure.dart';

class WaterAbsorption extends StatelessWidget {
  void calculateA() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Absorption of Coarse Aggregates'),
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
                Procedure(
                  procedure:
                      '1. A sample of about 3000 gm of aggregates shall be taken and dried in a ventilated oven at 110° C for 24 hours. It should then be cooled and weighed accurately (Weight A).',
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '2. The dried sample is then to be placed in a suitable container and covered with distilled water for 24 + ½ hours at a temperature of 22 to 32° C. Air bubbles on the surface of the aggregates shall be removed as then appear by gentle agitation with a rod.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(
                  height: 15,
                ),
                Procedure(
                  procedure:
                      '3. The sample will then be taken out of water and the surface water in the particles is removed by means of a damp cloth. The surface dried sample will then be immediately weight (Weight B).',
                ),
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
      // backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
