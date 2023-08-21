class DbClass {
  String? login;
  String? password;
// TextEditingController loginController = TextEditingController();
// TextEditingController passwordController = TextEditingController();

  DbClass({this.login, this.password});

  andersonLogin() async {

    if (login == 'anderson' && password == '123456') {
      return true;
    } else {
      return false;
    }

  }
}
