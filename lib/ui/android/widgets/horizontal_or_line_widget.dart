import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HorizontalOrLineWidget extends StatelessWidget {
  HorizontalOrLineWidget({this.label, this.height});

  final String label;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
            height: height,
          ),
        ),
      ),
      Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Expanded(
        child: Container(
          margin: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Divider(
            color: Colors.black,
            thickness: 1,
            height: height,
          ),
        ),
      ),
    ]);
  }
}
