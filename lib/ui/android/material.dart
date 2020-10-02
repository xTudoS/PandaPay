import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/pages/start_page.dart';
import 'package:pandapay/ui/android/pages/app_page.dart';
// import 'package:pandapay/ui/android/pages/welcome_page.dart';
import 'package:pandapay/ui/android/utils/colors.dart';

class PandaPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "PandaPay",
        theme: ThemeData(
            primarySwatch: Cores.primaryBlack, textSelectionColor: Colors.grey),
        home: AppPage());
    // home: WelcomePage());
  }
}
