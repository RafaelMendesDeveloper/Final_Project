class AndersonClass {
  String? login;
  String? password;

  AndersonClass({this.login, this.password});

  andersonLogin(String? login, String? password) async {
    if (login == 'anderson' && password == '123456') {
      return true;
    }
    else {
      return false;
    }
  }
}
