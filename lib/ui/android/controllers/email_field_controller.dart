import 'package:flutter/material.dart';

class EmailFieldController {
  EmailFieldController._();
  final TextEditingController controller = TextEditingController();
  static final EmailFieldController instance = EmailFieldController._();
}
