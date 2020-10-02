import 'package:pandapay/storage/storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Api {
  static final String _url = "http://api-panda.herokuapp.com/api/";
  final Storage _storage = Storage();
  var _session = http.Client();

  // Register Function
  Future<Map<String, dynamic>> register(
      String name, String username, String email, String passwd) async {
    String url = _url + "register/";
    Map<String, String> payload = {
      "first_name": name,
      "username": username,
      "email": email,
      "password": passwd,
    };

    var r = await _session.post(url, body: payload);

    Map<String, dynamic> data = json.decode(utf8.decode(r.bodyBytes));
    if (r.statusCode == 200) {
      data["hasError"] = false;
      await _storage.writeData(data["token"]);
    } else {
      data["hasError"] = true;
    }
    return data;
  }

  // Login Function
  Future<Map<String, dynamic>> login(String username, String passwd) async {
    String url = _url + "login/";
    Map<String, String> payload = {
      "username": username,
      "password": passwd,
    };

    var r = await _session.post(url, body: payload);

    Map<String, dynamic> data = json.decode(utf8.decode(r.bodyBytes));
    if (r.statusCode == 200) {
      data["hasError"] = false;
      await _storage.writeData(data["token"]);
    } else {
      data["hasError"] = true;
    }
    return data;
  }

  // Logout Funcion
  Future logout() async {
    String url = _url + "logout/";
    String token = await _storage.readData();
    await _session.post(url, headers: {"Authorization": "token $token"});
  }

  // Wallet Function
  Future<Map<String, dynamic>> carteira() async {
    String url = _url + "carteira/";
    String token = await _storage.readData();
    var r = await _session.get(url, headers: {"Authorization": "token $token"});
    Map<String, dynamic> data = json.decode(utf8.decode(r.bodyBytes));
    if (r.statusCode == 200) {
      data["hasError"] = false;
    } else {
      data["hasError"] = true;
    }
    return data;
  }
}
