import 'package:flutter/material.dart';

class AlertDialogError extends StatelessWidget {
  final String _msg;
  AlertDialogError(this._msg);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10.0,
      title: Text("Erro"),
      content: Text(
        this._msg,
        style: TextStyle(fontSize: 20),
      ),
      actionsPadding: EdgeInsets.all(0.0),
      actions: <Widget>[
        RaisedButton(
            onPressed: () => Navigator.of(context).pop(context),
            child: Text("OK", style: TextStyle(fontSize: 20)))
      ],
    );
  }
}
