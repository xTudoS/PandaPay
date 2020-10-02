import 'package:flutter/material.dart';

class NameFieldController {
  NameFieldController._();
  final TextEditingController controller = TextEditingController();
  static final instance = NameFieldController._();
}
