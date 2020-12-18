import 'package:flutter/material.dart';

import 'screens/home_page/index.dart';
import './screens/material _testing/material_testing.dart';
import './screens/fine_aggregate/fine_aggregate.dart';
import './screens/coarse_aggregate/coarse_aggregate.dart';
import './screens/fine_aggregate/moisture_content.dart';
import './screens/fine_aggregate/specific_gravity.dart';
import './screens/fine_aggregate/silt_content.dart';
import './screens/coarse_aggregate/water_absorption.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Final Year Project',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          // This makes the visual density adapt to the platform that you run
          // the app on. For desktop platforms, the controls will be smaller and
          // closer together (more dense) than on mobile platforms.
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.blue.shade50,
        ),
        home: MyHomePage(title: 'Final Year Project'),
        routes: {
          '/material-testing': (ctx) => MaterialTesting(),
          '/fine-aggregate': (ctx) => FineAggregate(),
          '/coarse-aggregate': (ctx) => CoarseAggregate(),
          '/fine-aggregate/moisture-content': (ctx) => MoistureContent(),
          '/fine-aggregate/specific-gravity': (ctx) => SpecificGravity(),
          '/fine-aggregate/silt_content': (ctx) => SiltContent(),
          '/coarse-aggregate/water-absorption': (ctx) => WaterAbsorption(),
        });
  }
}
