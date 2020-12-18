import 'package:flutter/material.dart';

class Procedure extends StatefulWidget {
  final String procedure;
  final String type;
  final Function getValues;

  Procedure({@required this.procedure, @required this.getValues, @required this.type});

  @override
  _ProcedureState createState() => _ProcedureState();
}

class _ProcedureState extends State<Procedure> {
  FocusNode focusNode;
  String inputText;

  @override
  void initState() {
    super.initState();
    focusNode = new FocusNode();
    focusNode.addListener(() {
      if (!focusNode.hasFocus) {
        widget.getValues(widget.type, inputText);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Text(
            widget.procedure,
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
            onChanged: (value) {
              inputText = value;
            },
            focusNode: focusNode,
          ),
          width: 50,
        ),
      ],
    );
  }
}
