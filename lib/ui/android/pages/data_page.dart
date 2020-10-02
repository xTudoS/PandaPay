import 'package:flutter/material.dart';
import 'package:pandapay/ui/android/widgets/raised_button_widget.dart';

class DataPage extends StatelessWidget {
  final data;
  final func;
  DataPage(this.data, this.func);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            "Meus Dados",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
        ),
        Divider(height: 100, color: Colors.transparent),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Nome: ${data['user']['first_name']}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Email: ${data['user']['email']}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Saldo: R\$ ${data['wallet']}",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Divider(height: 10, color: Colors.transparent),
        RaisedButtonWidget(
          "Sair",
          func,
        ),
      ],
    );
  }
}
