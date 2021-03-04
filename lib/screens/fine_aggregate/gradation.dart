import 'package:flutter/material.dart';

import '../../widgets/test_details_modal.dart';

class Gradation extends StatelessWidget {
  final input = {};
  final data = {
    '10MM': {},
    '4.75MM': {},
    '2.36MM': {},
    '1.18MM': {},
    '600μ': {},
    '300μ': {},
    '150μ': {},
    '<150μ': {},
  };

  void calculate(ctx) {
    double sum = 0;
    double finenessSum = 0;

    for (var item in input.keys) {
      data[item]['wt_retained'] = double.parse(input[item]);
    }
    for (var item in data.keys) {
      sum += data[item]['wt_retained'];
      data[item]['cm_wt_retained'] = sum;
    }
    for (var item in data.keys) {
      data[item]['cm_%_wt_retained'] = (data[item]['cm_wt_retained'] / sum) * 100;
    }
    for (var item in data.keys) {
      data[item]['cm_%_wt_passing'] = 100 - data[item]['cm_%_wt_retained'];
      finenessSum += data[item]['cm_%_wt_retained'];
    }

    double finenessModulus = finenessSum / 100;

    getTestDetails(
      context: ctx,
      testCategory: 'Fine Aggregate',
      testName: 'Gradation',
      values: {
        'data': data,
        'fineness_modulus': finenessModulus,
      },
    );

    for (var item in data.keys) {
      print(data[item]);
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
          title: Text('Gradation of Fine Aggregates'),
        ),
        body: ListView(
          children: [
            Card(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 5),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Table(
                      border: TableBorder.all(),
                      children: [
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'IS SIEVE SIZE',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text(
                                  'WEIGHT RETAINED (gm)',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('10MM'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['10MM'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('4.75MM'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['4.75MM'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('2.36MM'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['2.36MM'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('1.18MM'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['1.18MM'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('600μ'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['600μ'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('300μ'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['300μ'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('150μ'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['150μ'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Text('Lower than 150μ'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: TextField(
                                  onChanged: (value) {
                                    input['<150μ'] = value;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
          ],
        ),
      ),
    );
  }
}
