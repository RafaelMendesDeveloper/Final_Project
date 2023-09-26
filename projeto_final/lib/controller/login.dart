import 'package:flutter/material.dart';

import '../entities/dealership.dart';
import '../model/database.dart';

class LoginProvider with ChangeNotifier {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<Dealership?> getDealership(String username, String password) async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
        TabelDealership.tablename,
        whereArgs: [
          username,
          password,
        ],
        where:
            '${TabelDealership.name} = ? and ${TabelDealership.password} = ?');

    if (result.isNotEmpty) {
      final item = result.first;
      username = item[TabelDealership.name];

      return Dealership(
          cnpj: item[TabelDealership.cnpj],
          name: item[TabelDealership.name],
          autonomyLevel: item[TabelDealership.autonomyLevel],
          password: item[TabelDealership.password],
          photo: item[TabelDealership.photo],);
    }

    notifyListeners();
    return null;
  }
}
