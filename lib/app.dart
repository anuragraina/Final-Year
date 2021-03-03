import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './services/auth.dart';
import './models/user.dart';

import './screens/wrapper.dart';
import './screens/material _testing/material_testing.dart';
import './screens/fine_aggregate/fine_aggregate.dart';
import './screens/coarse_aggregate/coarse_aggregate.dart';
import './screens/fine_aggregate/moisture_content.dart';
import './screens/fine_aggregate/specific_gravity.dart';
import './screens/fine_aggregate/silt_content.dart';
import './screens/coarse_aggregate/water_absorption.dart';
import './screens/coarse_aggregate/specific_gravity_ca.dart';
import './screens/approved tests/approved_tests.dart';
import './screens/pending tests/pending_tests.dart';
import './screens/fine_aggregate/gradation.dart';
import './screens/coarse_aggregate/gradation_ca.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<CustomUser>.value(
      value: AuthService().user,
      child: MaterialApp(
          title: 'Final Year Project',
          theme: ThemeData(
            primarySwatch: Colors.green,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            // backgroundColor: Colors.blue.shade50,
            backgroundColor: Colors.purple.shade50,
          ),
          home: Wrapper(),
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
            '/approved-tests': (ctx) => ApprovedTests(),
            '/pending-tests': (ctx) => PendingTests(),
            '/fine-aggregate/gradation': (ctx) => Gradation(),
            '/coarse-aggregate/gradation_ca': (ctx) => GradationCA(),
          }),
    );
  }
}
