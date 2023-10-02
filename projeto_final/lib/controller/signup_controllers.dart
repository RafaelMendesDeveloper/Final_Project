// ignore_for_file: avoid_print

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../entities/dealership.dart';
import '../model/database.dart';

class DealershipProvider with ChangeNotifier {
  DealershipProvider({required Dealership? dealership}) {
    // ignore: discarded_futures
    load();
  }

  Dealership? dealership;

  String cnpj = '';
  String name = '';
  String password = '';

  final controller = DealershipController();

  final _controllerCnpj = TextEditingController();
  final _controllerDealershipName = TextEditingController();
  final _controllerAutonomyLevel = TextEditingController();
  final _controllerPassword = TextEditingController();
  String? _controllerPhoto;
  

  final _listDealership = <Dealership>[];
  List<Dealership> get listDealership => _listDealership;

  TextEditingController get controllerCnpj => _controllerCnpj;
  TextEditingController get controllerDealershipName =>
      _controllerDealershipName;
  TextEditingController get controllerAutonomyLevel => _controllerAutonomyLevel;
  TextEditingController get controllerPassword => _controllerPassword;
  String? get controllerPhoto => _controllerPhoto;

  Future<void> insert() async {
    (controllerPhoto);
    final dealership = Dealership(
        cnpj: controllerCnpj.text,
        name: controllerDealershipName.text,
        autonomyLevel: controllerAutonomyLevel.text,
        password: controllerPassword.text,
        photo: controllerPhoto);

    print(controllerPhoto);

    await controller.insert(dealership);
    await load();

    controllerCnpj.clear();
    controllerDealershipName.clear();
    controllerAutonomyLevel.clear();
    controllerPassword.clear();
    controllerAutonomyLevel.clear();

    print(dealership.password);
    print(dealership.photo.toString());

    notifyListeners();
  }

  Future<void> load() async {
    final list = await controller.select();

    listDealership.clear();
    listDealership.addAll(list);

    if (dealership == null) {
      return;
    }

    _controllerCnpj.text = dealership?.cnpj ?? '';
    _controllerDealershipName.text = dealership?.name ?? '';
    _controllerPassword.text = dealership?.password ?? '';

    notifyListeners();
  }

  Future<void> delete(int? id) async {
    final database = await getDatabase();

    await database.delete(
      'dealership',
      where: 'id = ?',
      whereArgs: [id],
    );

    notifyListeners();
  }

  Future<List<Dealership>> select() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      TabelDealership.tablename,
    );

    var list = <Dealership>[];

    for (final item in result) {
      list.add(
        Dealership(
          id: item[TabelDealership.id],
          cnpj: item[TabelDealership.cnpj],
          name: item[TabelDealership.name],
          autonomyLevel: item[TabelDealership.autonomyLevel],
          password: item[TabelDealership.password],
          photo: item[TabelDealership.photo],
        ),
      );
    }

    return list;
  }

  Future<void> update(Dealership? dealership) async {
    final database = await getDatabase();

    var map = TabelDealership.toMap(dealership);

    await database.update(
      TabelDealership.tablename,
      map,
      where: '${TabelDealership.id} = ?',
      whereArgs: [
        {dealership?.id}
      ],
    );
    print(TabelDealership.tablename);
    print(TabelDealership.id);
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

  Future<bool> getDealership(int? id) async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result =
        await database.query(TabelDealership.tablename,
            whereArgs: [
              id,
            ],
            where: '${TabelDealership.id} = ?');

    if (result.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future pickImage() async {
    {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      _controllerPhoto = image.path;
    }
    notifyListeners();
  }

}
