import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/controllers/passwd_field_controller.dart';
import 'package:pandapay/ui/android/utils/passwd_validated.dart';

class PasswdFieldWidget extends StatefulWidget {
  @override
  _PasswdFieldWidgetState createState() => _PasswdFieldWidgetState();
}

class _PasswdFieldWidgetState extends State<PasswdFieldWidget> {
  bool _visibilityPassword = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: PasswdFieldController.instance.controller,
      keyboardType: TextInputType.visiblePassword,
      autovalidate: true,
      validator: (String value) => passwdValidated(value),
      maxLines: 1,
      obscureText: _visibilityPassword,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
              _visibilityPassword ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            setState(() {
              _visibilityPassword = !_visibilityPassword;
            });
          },
        ),
        hintText: 'Senha',
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
