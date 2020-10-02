import 'package:flutter/material.dart';

class RaisedButtonWidget extends StatelessWidget {
  final function;
  final String label;
  final double radius;
  RaisedButtonWidget(this.label, this.function, {this.radius: 5});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        height: 50,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(this.radius),
          ),
          color: Colors.black,
          colorBrightness: Brightness.dark,
          onPressed: this.function,
          child: Text(
            this.label,
            style: TextStyle(fontSize: 30.0, color: Colors.white),
          ),
        ));
  }
}
