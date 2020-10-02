import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/pages/app_page.dart';
import 'package:pandapay/ui/android/utils/page_router.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: () =>
              Navigator.of(context).pushReplacement(PageRouter(AppPage())),
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: EdgeInsets.only(top: 100),
                    child: Text(
                      "BEM VINDA(O)\nAO PANDAPAY",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  )),
              Center(child: Image.asset("src/img/panda.png")),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: EdgeInsets.only(
                        bottom: 200,
                      ),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          children: [
                            TextSpan(
                                text: "#V",
                                style: TextStyle(
                                  fontSize: 50,
                                )),
                            TextSpan(text: "AMO"),
                            TextSpan(
                                text: "N",
                                style: TextStyle(
                                  fontSize: 50,
                                )),
                            TextSpan(text: "ESSA"),
                          ],
                        ),
                      ))),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: Text(
                    "(Toque Para Continuar)",
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              )
            ],
          )),
    ));
  }
}
