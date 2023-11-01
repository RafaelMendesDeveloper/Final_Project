import 'package:intl/intl.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../entities/admin.dart';
import '../entities/cars.dart';
import '../entities/dealership.dart';
import '../entities/sale.dart';

Future<Database> getDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'anderson.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) async {
      await db.execute(TabelAdmin.createTable);
      await db.execute(TabelDealership.createTable);
      await db.execute(TabelCars.createTable);
      await db.execute(TabelSales.createTable);
    },
    version: 1,
  );
}

// ignore: avoid_classes_with_only_static_members
class TabelCars {
  static const String createTable = '''
  CREATE TABLE $tablename(
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $model TEXT NOT NULL,
  $brand TEXT NOT NULL,
  $plate TEXT NOT NULL,
  $carYear INTEGER NOT NULL,
  $carPic TEXT NOT NULL,
  $buyPrice REAL NOT NULL,
  $buyDateTime TEXT NOT NULL
  );
''';

  static const String tablename = 'cars';

  static const String id = 'id';
  static const String model = 'model';
  static const String brand = 'brand';
  static const String plate = 'plate';
  static const String carYear = 'carYear';
  static const String carPic = 'carPic';
  static const String buyPrice = 'buyPrice';
  static const String buyDateTime = 'buyDateTime';

  static Map<String, dynamic> toMap(Cars car) {
    final map = <String, dynamic>{};

    map[TabelCars.id] = car.id;
    map[TabelCars.model] = car.model;
    map[TabelCars.brand] = car.brand;
    map[TabelCars.plate] = car.plate;
    map[TabelCars.carYear] = car.carYear;
    map[TabelCars.carPic] = car.carPic;
    map[TabelCars.buyPrice] = car.buyPrice;
    map[TabelCars.buyDateTime] =
        DateFormat('yyyy-MM-dd').format(car.buyDateTime!);

    return map;
  }
}

// ignore: avoid_classes_with_only_static_members
class TabelAdmin {
  static const String createTable = '''
  CREATE TABLE $tableName (
  $cpf TEXT PRIMARY KEY NOT NULL,
  $username TEXT NOT NULL,
  $fullname TEXT NOT NULL,
  $password TEXT NOT NULL,
  $photo TEXT NOT NULL
  );
''';

  static const String tableName = 'admin';

  static const String cpf = 'cpf';
  static const String username = 'username';
  static const String fullname = 'fullname';
  static const String password = 'password';
  static const String photo = 'photo';

  static Map<String, dynamic> toMap(Admin admin) {
    final map = <String, dynamic>{};

    map[TabelAdmin.cpf] = admin.cpf;
    map[TabelAdmin.username] = admin.username;
    map[TabelAdmin.fullname] = admin.fullName;
    map[TabelAdmin.password] = admin.password;
    map[TabelAdmin.photo] = admin.photo;

    return map;
  }
}

// ignore: avoid_classes_with_only_static_members
class TabelDealership {
  static const String createTable = '''
  CREATE TABLE $tablename (
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $cnpj TEXT NOT NULL,
  $name TEXT NOT NULL,
  $autonomyLevel TEXT NOT NULL,
  $password TEXT NOT NULL,
  $photo TEXT NOT NULL
  );
''';

  static const String tablename = 'dealership';

  static const String id = 'id';
  static const String cnpj = 'cnpj';
  static const String name = 'name';
  static const String autonomyLevel = 'autonomy_level';
  static const String password = 'password';
  static const String photo = 'photo';

  static Map<String, dynamic> toMap(Dealership dealership) {
    final map = <String, dynamic>{};

    map[TabelDealership.cnpj] = dealership.cnpj;
    map[TabelDealership.name] = dealership.name;
    map[TabelDealership.autonomyLevel] = dealership.autonomyLevel;
    map[TabelDealership.password] = dealership.password;
    map[TabelDealership.photo] = dealership.photo;

    return map;
  }
}

// required this.id,
//   required this.cpfClient,
//   required this.nameClient,
//   required this.saleDateTime,
//   required this.salePrice,
//   required this.priceDealership,
//   required this.priceAnderson,
//   required this.priceSafety,
//   required this.idCar,

// ignore: avoid_classes_with_only_static_members
class TabelSales {
  static const String createTable = '''
  CREATE TABLE $tablename (
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $cpfClient TEXT NOT NULL,
  $nameClient TEXT NOT NULL,
  $saleDateTime TEXT NOT NULL,
  $salePrice REAL NOT NULL,
  $priceDealership REAL NOT NULL,
  $priceAnderson REAL NOT NULL,
  $priceSafety REAL NOT NULL,
  $idCar INTEGER NOT NULL
  );
''';

  static const String tablename = 'sale';

  static const String id = 'id';
  static const String cpfClient = 'cpfClient';
  static const String nameClient = 'nameClient';
  static const String saleDateTime = 'saleDateTime';
  static const String salePrice = 'salePrice';
  static const String priceDealership = 'priceDealership';
  static const String priceAnderson = 'priceAnderson';
  static const String priceSafety = 'priceSafety';
  static const String idCar = 'idCar';

  static Map<String, dynamic> toMap(Sale? sale) {
    final map = <String, dynamic>{};

    map[TabelSales.id] = sale?.id;
    map[TabelSales.cpfClient] = sale?.cpfClient;
    map[TabelSales.nameClient] = sale?.nameClient;
    map[TabelSales.saleDateTime] = sale?.saleDateTime;
    map[TabelSales.salePrice] = sale?.salePrice;
    map[TabelSales.priceDealership] = sale?.priceDealership;
    map[TabelSales.priceAnderson] = sale?.priceAnderson;
    map[TabelSales.priceSafety] = sale?.priceSafety;
    map[TabelSales.idCar] = sale?.idCar;

    return map;
  }
}

class AdminController {
  Future<void> insert(Admin admin) async {
    final database = await getDatabase();
    final map = TabelAdmin.toMap(admin);

    await database.insert(TabelAdmin.tableName, map);

    return;
  }

  Future<List<Admin>> select() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      TabelAdmin.tableName,
    );

    var list = <Admin>[];

    for (var item in result) {
      list.add(
        Admin(
          cpf: item[TabelAdmin.cpf],
          username: item[TabelAdmin.username],
          fullName: item[TabelAdmin.fullname],
          password: item[TabelAdmin.password],
          photo: item[TabelAdmin.photo],
        ),
      );
    }

    return list;
  }
}

class DealershipController {
  Future<void> insert(Dealership dealership) async {
    final database = await getDatabase();
    final map = TabelDealership.toMap(dealership);

    await database.insert(TabelDealership.tablename, map);

    return;
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
}

class CarsController {
  Future<void> insert(Cars cars) async {
    final database = await getDatabase();
    final map = TabelCars.toMap(cars);

    await database.insert(TabelCars.tablename, map);

    return;
  }

  Future<void> delete(Cars cars) async {
    final database = await getDatabase();

    await database.delete(
      TabelCars.tablename,
      where: '${TabelCars.id} = ?',
      whereArgs: [cars.id],
    );
  }

  Future<List<Cars>> select() async {
    final database = await getDatabase();

    final List<Map<String, dynamic>> result = await database.query(
      TabelCars.tablename,
    );

    var list = <Cars>[];

    for (final item in result) {
      list.add(
        Cars(
          id: item[TabelCars.id],
          model: item[TabelCars.model],
          brand: item[TabelCars.brand],
          plate: item[TabelCars.plate],
          carYear: item[TabelCars.carYear],
          carPic: item[TabelCars.carPic],
          buyPrice: item[TabelCars.buyPrice],
          buyDateTime: DateFormat('yyyy-MM-dd').parse(
            item[TabelCars.buyDateTime],
          ),
        ),
      );
    }
    return list;
  }

  Future<void> update(Cars cars) async {
    final database = await getDatabase();

    var map = TabelCars.toMap(cars);

    await database.update(
      TabelCars.tablename,
      map,
      where: '${TabelCars.id} = ?',
      whereArgs: [TabelCars.id],
    );
  }
}

class SalesController {
  Future<void> insert(Sale sale) async {
    final database = await getDatabase();
    final map = TabelSales.toMap(sale);

    await database.insert(TabelSales.tablename, map);

    return;
  }

  Future<List<Sale>> select() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> result = await database.query(
      TabelSales.tablename,
    );

    var list = <Sale>[];

    for (final item in result) {
      list.add(
        Sale(
            id: item[TabelSales.id],
            cpfClient: item[TabelSales.cpfClient],
            nameClient: item[TabelSales.nameClient],
            saleDateTime: item[TabelSales.saleDateTime],
            salePrice: item[TabelSales.salePrice],
            priceDealership: item[TabelSales.priceDealership],
            priceAnderson: item[TabelSales.priceAnderson],
            priceSafety: item[TabelSales.priceSafety],
            idCar: item[TabelSales.idCar]),
      );
    }

    return list;
  }
}
