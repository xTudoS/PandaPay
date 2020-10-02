import 'package:flutter/material.dart';

class AuthenticateAlertDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          CircularProgressIndicator(),
          Text("Aguarde um momento...")
        ],
      ),
    );
  }
}