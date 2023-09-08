import 'package:flutter/material.dart';
import '../../controller/database.dart';
import '../../entities/admin.dart';

class AdminProvider with ChangeNotifier {
  AdminProvider() {
    load();
  }
  final controller = AdminController();

  final _controllerCpf = TextEditingController();
  final _controllerAdminUserName = TextEditingController();
  final _controllerAdminName = TextEditingController();
  final _controllerPassword = TextEditingController();

  final _listAdmin = <Admin>[];
  List<Admin> get listAdmin => _listAdmin;

  TextEditingController get controllerCpf => _controllerCpf;
  TextEditingController get controllerAdminUserName => _controllerAdminUserName;
  TextEditingController get controllerAdminName => _controllerAdminName;
  TextEditingController get controllerPassword => _controllerPassword;

  Future<void> insert() async {
    final admin = Admin(
        cpf: controllerCpf.text,
        username: controllerAdminUserName.text,
        fullName: controllerAdminName.text,
        password: controllerPassword.text);

    await controller.insert(admin);
    await load();

    controllerCpf.clear();
    controllerAdminName.clear();
    controllerAdminUserName.clear();
    controllerPassword.clear();

    notifyListeners();
  }

  Future<void> load() async {
    final list = await controller.select();

    listAdmin.clear();
    listAdmin.addAll(list);
    print(
        'HERE ---------------------------------------> ${listAdmin.length}');

    notifyListeners();
  }

  bool fazerLogin() {
    return true;
  }
}
