import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/widgets/horizontal_or_line_widget.dart';
import 'package:pandapay/ui/android/widgets/raised_button_widget.dart';
import 'package:pandapay/ui/android/utils/page_router.dart';
import 'package:pandapay/ui/android/pages/login_page.dart';
import 'package:pandapay/ui/android/pages/register_first_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: Image.asset(
                  "src/img/logo_black.png",
                  fit: BoxFit.contain,
                ),
              ),
              Divider(
                height: 150,
                color: Colors.transparent,
              ),
              RaisedButtonWidget(
                  "CRIAR CONTA",
                  () => Navigator.of(context)
                      .push(PageRouter(RegisterFirstPage()))),
              HorizontalOrLineWidget(
                height: 50,
                label: "OU",
              ),
              RaisedButtonWidget("ENTRAR",
                  () => Navigator.of(context).push(PageRouter(LoginPage()))),
            ],
          ),
        ),
      ),
    );
  }
}
