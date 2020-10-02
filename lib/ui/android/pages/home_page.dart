import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String wallet;
  final func;
  HomePage(this.wallet, this.func);
  @override
  _HomePageState createState() => _HomePageState(this.wallet, this.func);
}

class _HomePageState extends State<HomePage> {
  bool _visibilityWallet = true;
  final String wallet;
  final func;
  IconData currencyExchangeIcon =
      IconData(0x1F4B1, fontFamily: 'MaterialIcons');
  _HomePageState(this.wallet, this.func);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20),
            height: 100,
            color: Colors.grey[300],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Meu saldo\n",
                      ),
                      TextSpan(
                          text: _visibilityWallet ? "R\$ $wallet" : "R\$ --",
                          style: TextStyle(
                            fontSize: 30,
                          )),
                    ],
                  ),
                ),
                IconButton(
                  iconSize: 30,
                  icon: Icon(_visibilityWallet
                      ? Icons.visibility_off
                      : Icons.visibility),
                  onPressed: () => setState(() {
                    _visibilityWallet = !_visibilityWallet;
                  }),
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 30,
            child: RaisedButton(
              onPressed: this.func,
              color: Colors.grey[400],
              child: Text("Ver minhas transações"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 30, bottom: 30),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    onPressed: () => {},
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Sacar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: RaisedButton(
                    onPressed: () => {},
                    color: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text(
                      "Depositar",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20),
            child: Container(
              height: 260,
              color: Colors.grey[200],
              child: GridView.count(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  crossAxisCount: 3,
                  children: List.generate(
                      6,
                      (index) => Padding(
                            padding: EdgeInsets.only(top: 20, left: 20),
                            child: RaisedButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(Icons.phone_iphone),
                                  Text(
                                    "Recarregar\nCelular",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ))),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: Container(
                height: 100,
                padding: EdgeInsets.all(20),
                color: Colors.grey[200],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      currencyExchangeIcon,
                      size: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Transfira ilimitadamente",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 300,
                          child: Text(
                            "Com o PandaPay você pode transferir para onde\nquiser, para quem quiser, quantas vezes quiser.",
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
