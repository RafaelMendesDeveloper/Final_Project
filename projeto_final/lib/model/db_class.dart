import 'package:flutter/material.dart';

class DbClass {
  TextEditingController? loginController;
  TextEditingController? passwordController;
// TextEditingController loginController = TextEditingController();
// TextEditingController passwordController = TextEditingController();

  DbClass({this.loginController, this.passwordController});

  andersonLogin() async {
    String login = loginController?.text ?? '';
    String password = passwordController?.text ?? '';

    if (login == 'anderson' && password == '123456') {
      return true;
    } else {
      return false;
    }

  }
}
