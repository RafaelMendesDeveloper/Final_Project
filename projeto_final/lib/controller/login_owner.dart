import 'package:flutter/material.dart';
import 'package:projeto_final/model/database.dart';

import '../entities/admin.dart';

class LoginAdmProvider with ChangeNotifier {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<dynamic> getAdmin(String username) async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      TabelAdmin.tableName,
    );

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


