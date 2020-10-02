import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/controllers/username_field_controller.dart';

class UsernameFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: UsernameFieldController.instance.controller,
      keyboardType: TextInputType.name,
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Username",
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        helperText: "Digite seu username",
      ),
    );
  }
}
