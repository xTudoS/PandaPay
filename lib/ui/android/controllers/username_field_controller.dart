import 'package:flutter/material.dart';

class UsernameFieldController {
  UsernameFieldController._();
  final TextEditingController controller = TextEditingController();
  static final instance = UsernameFieldController._();
}
