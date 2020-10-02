import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/controllers/username_field_controller.dart';
import 'package:pandapay/ui/android/controllers/passwd_field_controller.dart';
import 'package:pandapay/ui/android/utils/page_router.dart';
import 'package:pandapay/ui/android/pages/app_page.dart';
import 'package:pandapay/ui/android/pages/register_first_page.dart';
import 'package:pandapay/ui/android/widgets/raised_button_widget.dart';
import 'package:pandapay/ui/android/widgets/username_field_widget.dart';
import 'package:pandapay/ui/android/widgets/alert_dialog_error_widget.dart';
import 'package:pandapay/ui/android/widgets/authenticate_alert_dialog_widget.dart';
import 'package:pandapay/api/api.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _hasError = false;
  bool _visibilityPassword = true;
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
              UsernameFieldWidget(),
              Divider(
                height: 20,
                color: Colors.transparent,
              ),
              TextFormField(
                controller: PasswdFieldController.instance.controller,
                keyboardType: TextInputType.visiblePassword,
                autovalidate: true,
                validator: (String value) {
                  if (value.length > 0) {
                    return null;
                  }
                  return "Informe sua senha";
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
                "ENTRAR",
                () => _submitButton(),
              ),
              FlatButton(
                onPressed: () {},
                child: Text("Esqueceu a senha?"),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Ainda não tem uma conta?"),
            FlatButton(
              padding: EdgeInsets.all(0),
              onPressed: () =>
                  Navigator.of(context).push(PageRouter(RegisterFirstPage())),
              child: Text("Cadastre-se"),
            )
          ],
        ),
      ),
    );
  }

  bool validatedValues() {
    String username = UsernameFieldController.instance.controller.text;
    String passwd = PasswdFieldController.instance.controller.text;
    return (username.length > 0) && (passwd.length > 0);
  }

  void _submitButton() async {
    if (validatedValues()) {
      setState(() => _hasError = false);
      String username = UsernameFieldController.instance.controller.text;
      String passwd = PasswdFieldController.instance.controller.text;
      showAlertDialogAuthenticate();
      Map<String, dynamic> data = await api.login(username, passwd);
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
        UsernameFieldController.instance.controller.text = "";
        PasswdFieldController.instance.controller.text = "";
        Navigator.of(context).pop();
        Navigator.of(context)
            .pushAndRemoveUntil((PageRouter(AppPage())), (route) => false);
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
