import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../entities/cars.dart';
import '../model/database.dart';
import 'api_controller.dart';

class CarsProvider with ChangeNotifier {
  CarsProvider() {
    init();
    unawaited(load());
  }

  final controller = CarsController();

  final _controllerModel = TextEditingController();
  final _controllerBrand = TextEditingController();
  final _controllerPlate = TextEditingController();
  final _controllerCarYear = TextEditingController();
  final _controllerBuyPrice = TextEditingController();
  final _controllerBuyDateTime = TextEditingController();
  String? _controllerPhoto;

  final _listCar = <Cars>[];
  List<Cars> get listCar => _listCar;

  TextEditingController get controllerModel => _controllerModel;
  TextEditingController get controllerBrand => _controllerBrand;
  TextEditingController get controllerPlate => _controllerPlate;
  TextEditingController get controllerCarYear => _controllerCarYear;
  TextEditingController get controllerBuyPrice => _controllerBuyPrice;
  TextEditingController get controllerBuyDateTime => _controllerBuyDateTime;
  String? get controllerPhoto => _controllerPhoto;

  final modelFieldFocusNode = FocusNode();
  final brandFieldFocusNode = FocusNode();
  final allBrands = <String>[];
  final allModels = <String>[];

  Future<void> insert() async {
    (controllerPhoto);
    final cars = Cars(
      model: controllerModel.text,
      brand: controllerBrand.text,
      plate: controllerPlate.text,
      carYear: controllerCarYear.text,
      carPic: controllerPhoto,
      buyPrice: controllerBuyPrice.text,
      buyDateTime: DateTime.parse(controllerBuyDateTime.text),
    );

    await controller.insert(cars);
    await load();

    controllerModel.clear();
    controllerBrand.clear();
    controllerPlate.clear();
    controllerCarYear.clear();
    controllerBuyPrice.clear();
    controllerBuyDateTime.clear();

    notifyListeners();
  }

  void init() async {
    final result = await getBrandNames();

    allBrands.addAll(result ?? []);
    print(allBrands);

    modelFieldFocusNode.addListener(
      () async {
        if (modelFieldFocusNode.hasFocus) {
          final result = await getModelsByBrand(controllerBrand.text);
          allModels.addAll(result!);
          print(allModels);
          notifyListeners();
        }
      },
    );
  }

  Future<void> load() async {
    final list = await controller.select();

    listCar.clear();
    listCar.addAll(list);

    notifyListeners();
  }

  Future pickImage() async {
    {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      _controllerPhoto = image.path;
    }
    notifyListeners();
  }

  Future<List<String>?> getBrandNames() async {
    final brandsList = await getCarBrands();

    final brandNames = <String>[];

    if (brandsList != null) {
      for (final item in brandsList) {
        brandNames.add(item.name!);
      }
    }
    return brandNames;
  }
}
