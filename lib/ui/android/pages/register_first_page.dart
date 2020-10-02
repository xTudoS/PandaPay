import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/controllers/name_field_controller.dart';
import 'package:pandapay/ui/android/controllers/email_field_controller.dart';
import 'package:pandapay/ui/android/utils/page_router.dart';
import 'package:pandapay/ui/android/pages/register_second_page.dart';
import 'package:pandapay/ui/android/widgets/raised_button_widget.dart';
import 'package:pandapay/ui/android/widgets/email_field_widget.dart';
import 'package:pandapay/ui/android/widgets/username_field_widget.dart';

class RegisterFirstPage extends StatefulWidget {
  @override
  _RegisterFirstPageState createState() => _RegisterFirstPageState();
}

class _RegisterFirstPageState extends State<RegisterFirstPage> {
  bool _hasError = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 50, left: 20, right: 20),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "src/img/logo_black.png",
                  fit: BoxFit.contain,
                  height: 150,
                ),
              ),
              Divider(
                height: 150,
                color: Colors.transparent,
              ),
              _hasError
                  ? Container(
                      child: Text("Dados informados inválidos",
                          textAlign: TextAlign.start,
                          style: TextStyle(color: Colors.red)),
                    )
                  : Container(),
              TextFormField(
                controller: NameFieldController.instance.controller,
                keyboardType: TextInputType.name,
                maxLines: 1,
                decoration: InputDecoration(
                  hintText: "Nome",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                  helperText: "Digite seu nome",
                ),
              ),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              UsernameFieldWidget(),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              EmailFieldWidget(),
              Divider(
                height: 30,
                color: Colors.transparent,
              ),
              RaisedButtonWidget(
                "PRÓXIMO",
                () => _submitButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool validatedEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return emailValid;
  }

  bool validatedValues() {
    String email = EmailFieldController.instance.controller.text;
    String name = NameFieldController.instance.controller.text;
    return validatedEmail(email) && (name.length > 0);
  }

  void _submitButton() {
    if (validatedValues()) {
      setState(() => _hasError = false);
      Navigator.of(context).push(PageRouter(RegisterSecondPage()));
    } else {
      setState(() => _hasError = true);
    }
  }
}
