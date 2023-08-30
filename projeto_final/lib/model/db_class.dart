class DbClass {
  String? login;
  String? password;
// TextEditingController loginController = TextEditingController();
// TextEditingController passwordController = TextEditingController();

  DbClass({this.login, this.password});

  // ignore: type_annotate_public_apis
  andersonLogin() {
    if (login != 'anderson') {
      return false;
    }
  }

  // ignore: type_annotate_public_apis
  andersonPassword() {
    if (password != '123456') {
      return false;
    }
  }

  // ignore: type_annotate_public_apis
  andersonSignIn() async {
    if (login == 'anderson' && password == '123456') {
      return true;
    } else {
      return false;
    }
  }
}
