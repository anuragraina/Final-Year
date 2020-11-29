import 'package:flutter/material.dart';

class MoistureContent extends StatelessWidget {
  void calculateA() {}

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
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '1. One litre jar is taken and filled with water upto certain mark and weighed (say Wc )',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '2. Sample of sand (approximate 200 gm) is weighed in a balance (say Ws is the weight )',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  width: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    '3. Sand sample is filled in the jar and the water is poured upto the previous mark. The jar is again weighed ( say Wm is the weight )',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  child: TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                  ),
                  width: 40,
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
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }
}
