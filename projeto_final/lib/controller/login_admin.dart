import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../entities/admin.dart';
import '../model/database.dart';

class AdminProvider with ChangeNotifier {
  AdminProvider() {
    unawaited(load());
  }
  final controller = AdminController();

  final _controllerCpf = TextEditingController();
  final _controllerAdminUserName = TextEditingController();
  final _controllerAdminName = TextEditingController();
  final _controllerPassword = TextEditingController();
  String? controllerPhoto;

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
        password: controllerPassword.text,
        photo: controllerPhoto);

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

    notifyListeners();
  }

  bool fazerLogin() {
    return true;
  }

  Future pickImage() async {
    {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      controllerPhoto = image.path;
    }
    notifyListeners();
  }
}
