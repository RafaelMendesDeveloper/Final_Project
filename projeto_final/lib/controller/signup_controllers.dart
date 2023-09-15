// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import '../../entities/dealership.dart';
import '../model/database.dart';

class DealershipProvider with ChangeNotifier {
  DealershipProvider() {
    load();
  }

  String password = '';

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

    print(dealership.password);

    notifyListeners();
  }

  Future<void> load() async {
    final list = await controller.select();

    listDealership.clear();
    listDealership.addAll(list);

    notifyListeners();
  }
  

   Future<List<Dealership>> select() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      TabelDealership.tablename,
    );

    var list = <Dealership>[];

    for (final item in result) {
      list.add(Dealership(
          id: item[TabelDealership.id],
          cnpj: item[TabelDealership.cnpj],
          name: item[TabelDealership.name],
          autonomyLevel: item[TabelDealership.autonomyLevel],
          password: item[TabelDealership.password]));
    }

    return list;
  }



  String gerarSenha() {
    var caracteres =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random();
    var senha = '';

    for (var i = 0; i < 15; i++) {
      var indice = random.nextInt(caracteres.length);
      senha += caracteres[indice];
    }

    return senha;
  }

  bool fazerLogin() {
    return true;
  }
}
