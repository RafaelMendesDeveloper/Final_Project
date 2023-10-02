import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../entities/cars.dart';
import '../model/database.dart';

class CarsProvider with ChangeNotifier {
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

    modelFieldFocusNode.addListener(
      () async {
        if (modelFieldFocusNode.hasFocus) {
          final result = await getModelsByBrand(controllerBrand.text);
          allModels.addAll(result!);
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

List<ModelEndpoint> fipeApiFromJson(String str) =>
    List<ModelEndpoint>.from(json.decode(str).map(ModelEndpoint.fromJson));

String fipeApiToJson(List<ModelEndpoint> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BrandEndpoint {
  final String? code;
  final String? name;

  BrandEndpoint({
    this.code,
    this.name,
  });

  factory BrandEndpoint.fromJson(Map<String, dynamic> json) => BrandEndpoint(
        code: json['codigo'],
        name: json['nome'],
      );

  Map<String, dynamic> toJson() => {
        'codigo': code,
        'nome': name,
      };

  @override
  String toString() {
    return name!;
  }
}

class ModelEndpoint {
  final int? code;
  final String? name;

  ModelEndpoint({
    this.code,
    this.name,
  });

  factory ModelEndpoint.fromJson(Map<String, dynamic> json) => ModelEndpoint(
        code: json['codigo'],
        name: json['nome'],
      );

  Map<String, dynamic> toJson() => {
        'codigo': code,
        'nome': name,
      };

  @override
  String toString() {
    return name!;
  }
}

Future<List<BrandEndpoint>?> getCarBrands() async {
  const url = 'https://parallelum.com.br/fipe/api/v1/carros/marcas/';
  final uri = Uri.parse(url);

  try {
    final response = await http.get(uri);

    final decodeResult = jsonDecode(response.body);

    final result = <BrandEndpoint>[];

    for (final item in decodeResult) {
      result.add(
        BrandEndpoint.fromJson(item),
      );
    }
    return result;
  } on Exception catch (e) {
    log('$e');
    return null;
  }
}

Future<List<ModelEndpoint>?> getCarModel(String brandName) async {
  final listOfBrands = await getCarBrands();

  var brand = listOfBrands!.firstWhere(
    (element) => element.name == brandName,
    orElse: () => BrandEndpoint(code: null),
  );

  if (brand.code != null) {
    final url =
        'https://parallelum.com.br/fipe/api/v1/carros/marcas/${brand.code}/modelos/';
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      final decodeResult = jsonDecode(response.body);
      log(decodeResult['modelos'].toString());

      final result = <ModelEndpoint>[];

      for (final item in decodeResult['modelos']) {
        result.add(
          ModelEndpoint.fromJson(item),
        );
      }
      return result;
    } on Exception catch (e) {
      log('$e');
      return null;
    }
  } else {
    return null;
  }
}

Future<List<String>?> getModelsByBrand(String brand) async {
    final modelsList = await getCarModel(brand);

    final modelNames = <String>[];

    if (modelsList != null) {
      for (final item in modelsList) {
        modelNames.add(item.name!);
      }
    }
    return modelNames;
  }