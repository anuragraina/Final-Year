import 'package:flutter/material.dart';

// Import the firebase_core plugin
import 'package:firebase_core/firebase_core.dart';

import './screens/signin/sign_in.dart';
//import 'screens/home_page/index.dart';
import './screens/material _testing/material_testing.dart';
import './screens/fine_aggregate/fine_aggregate.dart';
import './screens/coarse_aggregate/coarse_aggregate.dart';
import './screens/fine_aggregate/moisture_content.dart';
import './screens/fine_aggregate/specific_gravity.dart';
import './screens/fine_aggregate/silt_content.dart';
import './screens/coarse_aggregate/water_absorption.dart';
import './screens/coarse_aggregate/specific_gravity_ca.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(home: Text('Something went wrong!!!'));
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              title: 'Final Year Project',
              theme: ThemeData(
                primarySwatch: Colors.blue,
                visualDensity: VisualDensity.adaptivePlatformDensity,
                backgroundColor: Colors.blue.shade50,
              ),
              home: SignIn(),
              //home: MyHomePage(title: 'Final Year Project'),
              routes: {
                '/material-testing': (ctx) => MaterialTesting(),
                '/fine-aggregate': (ctx) => FineAggregate(),
                '/coarse-aggregate': (ctx) => CoarseAggregate(),
                '/fine-aggregate/moisture-content': (ctx) => MoistureContent(),
                '/fine-aggregate/specific-gravity': (ctx) => SpecificGravity(),
                '/fine-aggregate/silt-content': (ctx) => SiltContent(),
                '/coarse-aggregate/water-absorption': (ctx) => WaterAbsorption(),
                '/coarse-aggregate/specific-gravity': (ctx) => SpecificGravityCA(),
              });
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(home: Text('Loading...'));
        ;
      },
    );
  }
}
