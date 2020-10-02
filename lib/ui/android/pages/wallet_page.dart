import 'package:flutter/material.dart';

class WalletPage extends StatelessWidget {
  final String firstName;
  WalletPage(this.firstName);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        itemBuilder: (context, i) {
          return Column(
            children: [
              Container(
                height: 50,
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      firstName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 50, right: 50),
                      child: Icon(
                        i % 2 == 0 ? Icons.arrow_forward : Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    Text(
                      "xTudo",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(height: 20, color: Colors.transparent),
            ],
          );
        });
  }
}
