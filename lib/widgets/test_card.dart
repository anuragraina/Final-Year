import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  Test(this.testType);
  final String testType;

  void selectTest(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('/material-testing');
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTest(context),
      splashColor: Colors.blue,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 200,
        height: 100,
        child: Center(
            child: Text(
          testType,
          style: TextStyle(fontSize: 20),
        )),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.blue.shade100,
              blurRadius: 5.0, // soften the shadow
              offset: Offset(
                3.0, // Move to right 10  horizontally
                5.0, // Move to bottom 10 Vertically
              ),
            ),
          ],
        ),
      ),
    );
  }
}
