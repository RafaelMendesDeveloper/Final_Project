import 'package:flutter/material.dart';

import '../entities/admin.dart';
import '../model/database.dart';

class LoginAdmProvider with ChangeNotifier {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<Admin?> getAdmin(String username, String password) async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      TabelAdmin.tableName,
      whereArgs: [
        username,
        password,
      ],
      where: 
          '${TabelAdmin.username} = ? and ${TabelAdmin.password} = ?');

    if (result.isNotEmpty) {
      final item = result.first;
      username = item[TabelAdmin.username];

      return Admin(
        cpf: item[TabelAdmin.cpf],
        fullName: item[TabelAdmin.fullname],
        username: item[TabelAdmin.username],
        password: item[TabelAdmin.password],
      );
    }

    notifyListeners();
    return null;
  }
}