import 'package:flutter/material.dart';

class TestCard extends StatelessWidget {
  final String name;
  final String route;

  TestCard({@required this.name, this.route});

  void selectTest(BuildContext ctx) {
    if (route != null) Navigator.of(ctx).pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectTest(context),
      splashColor: Theme.of(context).primaryColorLight,
      borderRadius: BorderRadius.circular(15),
      child: Ink(
        width: 200,
        height: 100,
        child: Center(
            child: Text(
          name,
          style: TextStyle(
            fontSize: 20,
          ),
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
