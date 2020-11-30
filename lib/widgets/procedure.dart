import 'package:flutter/material.dart';

class Procedure extends StatelessWidget {
  final String procedure;
  final String variable;

  Procedure({@required this.procedure, @required this.variable});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            procedure,
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
          width: 50,
        ),
      ],
    );
  }
}
