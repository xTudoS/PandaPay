import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/controllers/email_field_controller.dart';

class EmailFieldWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: EmailFieldController.instance.controller,
      keyboardType: TextInputType.emailAddress,
      autovalidate: true,
      validator: (String value) {
        bool emailValid = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
        if (emailValid) {
          return null;
        }
        return 'Insira um email válido';
      },
      maxLines: 1,
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: 'Email',
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
