import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pandapay/ui/android/controllers/name_field_controller.dart';
import 'package:pandapay/ui/android/controllers/username_field_controller.dart';
import 'package:pandapay/ui/android/controllers/email_field_controller.dart';
import 'package:pandapay/ui/android/controllers/passwd_field_controller.dart';
import 'package:pandapay/ui/android/widgets/raised_button_widget.dart';
import 'package:pandapay/ui/android/widgets/passwd_field_widget.dart';
import 'package:pandapay/ui/android/widgets/alert_dialog_error_widget.dart';
import 'package:pandapay/ui/android/widgets/authenticate_alert_dialog_widget.dart';
import 'package:pandapay/ui/android/utils/passwd_validated.dart';
import 'package:pandapay/ui/android/utils/page_router.dart';
import 'package:pandapay/ui/android/pages/welcome_page.dart';
import 'package:pandapay/api/api.dart';

class RegisterSecondPage extends StatefulWidget {
  @override
  _RegisterSecondPageState createState() => _RegisterSecondPageState();
}

class _RegisterSecondPageState extends State<RegisterSecondPage> {
  bool _hasError = false;
  bool _visibilityPassword = true;
  TextEditingController _confirmPasswdController = TextEditingController();
  Api api = Api();

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
              PasswdFieldWidget(),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              TextFormField(
                controller: _confirmPasswdController,
                keyboardType: TextInputType.visiblePassword,
                autovalidate: true,
                validator: (String value) {
                  if (value == PasswdFieldController.instance.controller.text) {
                    return null;
                  }
                  return "As senhas devem ser iguais";
                },
                maxLines: 1,
                obscureText: _visibilityPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(_visibilityPassword
                        ? Icons.visibility
                        : Icons.visibility_off),
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
              ),
              Divider(
                height: 30,
                color: Colors.transparent,
              ),
              RaisedButtonWidget(
                "FINALIZAR",
                () => _submitButton(),
              ),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              FlatButton(
                onPressed: () => _launchURL(),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Ao finalizar você concorda com os ",
                        ),
                        TextSpan(
                            text: "termos de uso e políticas de privacidade",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            ))
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    const url = "https://pandapay.com.br";
    if (await canLaunch(url)) {
      await launch(url);
    }
  }

  bool validatedValues() {
    String passwd = PasswdFieldController.instance.controller.text;
    String confirmPasswd = _confirmPasswdController.text;
    return (passwdValidated(passwd) == null) && (passwd == confirmPasswd);
  }

  void _submitButton() async {
    if (validatedValues()) {
      setState(() => _hasError = false);
      String name = NameFieldController.instance.controller.text;
      String email = EmailFieldController.instance.controller.text;
      String username = UsernameFieldController.instance.controller.text;
      String passwd = PasswdFieldController.instance.controller.text;
      showAlertDialogAuthenticate();
      Map<String, dynamic> data =
          await api.register(name, username, email, passwd);
      if (data["hasError"]) {
        Navigator.of(context).pop();
        data.forEach((key, value) {
          if (key != "hasError") {
            for (var i = 0; i < data[key].length; i++) {
              showAlertDialogError(data[key][i]);
              break;
            }
          }
        });
        setState(() => _hasError = true);
      } else {
        PasswdFieldController.instance.controller.text = "";
        NameFieldController.instance.controller.text = "";
        EmailFieldController.instance.controller.text = "";
        UsernameFieldController.instance.controller.text = "";
        Navigator.of(context)
            .pushAndRemoveUntil((PageRouter(WelcomePage())), (route) => false);
      }
    } else {
      setState(() => _hasError = true);
    }
  }

  showAlertDialogError(String errorMsg) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogError(errorMsg);
        });
  }

  showAlertDialogAuthenticate() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AuthenticateAlertDialog();
        });
  }
}
