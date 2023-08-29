import 'package:flutter/material.dart';
import '../controller/database.dart';
import '../entities/dealership.dart';

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

class DealershipState extends ChangeNotifier {
  DealershipState() {
    load();
  }

  final controller = DealershipController();

  final _controllerCnpj = TextEditingController();
  final _controllerDealershipName = TextEditingController();
  final _controllerAutonomyLevel = TextEditingController();
  final _controllerPassword = TextEditingController();

  final _listDealership = <Dealership>[];
  List<Dealership> get listDealership => _listDealership;

  TextEditingController get controllerCnpj => _controllerCnpj;
  TextEditingController get controllerDealershipName =>
      _controllerDealershipName;
  TextEditingController get controllerAutonomyLevel => _controllerAutonomyLevel;
  TextEditingController get controllerPassword => _controllerPassword;

  Future<void> insert() async {
    final dealership = Dealership(
        cnpj: controllerCnpj.text,
        name: controllerDealershipName.text,
        autonomyLevel: controllerAutonomyLevel.text,
        password: controllerPassword.text);

    await controller.insert(dealership);
    await load();

    controllerCnpj.clear();
    controllerDealershipName.clear();
    controllerAutonomyLevel.clear();
    controllerPassword.clear();

    notifyListeners();
  }

  Future<void> load() async {
    final list = await controller.select();

    listDealership.clear();
    listDealership.addAll(list);

    notifyListeners();
  }
}
