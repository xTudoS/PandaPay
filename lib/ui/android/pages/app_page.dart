import 'package:flutter/material.dart';
import 'package:pandapay/api/api.dart';
import 'package:pandapay/ui/android/pages/start_page.dart';
import 'package:pandapay/ui/android/utils/page_router.dart';
import 'package:pandapay/ui/android/pages/data_page.dart';
import 'package:pandapay/ui/android/pages/wallet_page.dart';
import 'package:pandapay/ui/android/pages/home_page.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  final Api _api = Api();
  Map<String, dynamic> data;
  int _currentIndex = 0;

  List<Widget> tabs;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "src/img/icon.png",
            height: 30,
            fit: BoxFit.contain,
          ),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(
                data == null
                    ? "PandaPay"
                    : "Olá, ${data['user']['first_name']}",
                style: TextStyle(
                  color: Colors.black,
                )),
          ),
        ]),
      ),
      body: FutureBuilder(
        future: _getWallet(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(child: Text("Um erro ocorreu."));
            } else {
              return _getTab(_currentIndex);
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            title: Text("Início",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.white,
            ),
            title: Text("Carteira",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
            title: Text("Dados",
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  Future _getWallet() async {
    Map<String, dynamic> wallet = await _api.carteira();
    if (wallet["hasError"]) {
      Navigator.of(context).pushReplacement(PageRouter(StartPage()));
    }
    data = wallet;
  }

  _logout() async {
    await _api.logout();
    setState(() {});
  }

  Widget _getTab(int index) {
    String firstName;
    try {
      firstName = data['user']['first_name'];
    } catch (e) {
      return null;
    }
    Widget widget;
    switch (index) {
      case 0:
        {
          widget = HomePage(
              data['wallet'],
              () => setState(() {
                    _currentIndex = 1;
                  }));
        }
        break;
      case 1:
        {
          widget = WalletPage(firstName);
        }
        break;
      case 2:
        {
          widget = SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: DataPage(data, () => _logout()));
        }
        break;
      default:
        {
          widget = Center(child: Text("Um erro ocorreu."));
        }
        break;
    }
    return widget;
  }
}
