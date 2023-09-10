import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../entities/admin.dart';
import '../entities/dealership.dart';


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
    },
    version: 1,
  );
}

class TabelAdmin {
  static const String createTable = '''
  CREATE TABLE $tableName (
  $cpf TEXT PRIMARY KEY NOT NULL,
  $username TEXT NOT NULL,
  $fullname TEXT NOT NULL,
  $password TEXT NOT NULL
  );
''';

  static const String tableName = 'admin';

  static const String cpf = 'cpf';
  static const String username = 'username';
  static const String fullname = 'fullname';
  static const String password = 'password';

  static Map<String, dynamic> toMap(Admin admin) {
    final map = <String, dynamic>{};

    map[TabelAdmin.cpf] = admin.cpf;
    map[TabelAdmin.username] = admin.username;
    map[TabelAdmin.fullname] = admin.fullName;
    map[TabelAdmin.password] = admin.password;

    return map;
  }
}

class TabelDealership {
  static const String createTable = '''
  CREATE TABLE $tablename (
  $cnpj TEXT PRIMARY KEY NOT NULL,
  $name TEXT NOT NULL,
  $autonomyLevel TEXT NOT NULL,
  $password TEXT NOT NULL
  );
''';

  static const String tablename = 'dealership';

  static const String cnpj = 'cnpj';
  static const String name = 'name';
  static const String autonomyLevel = 'autonomy_level';
  static const String password = 'password';

  static Map<String, dynamic> toMap(Dealership dealership) {
    final map = <String, dynamic>{};

    map[TabelDealership.cnpj] = dealership.cnpj;
    map[TabelDealership.name] = dealership.name;
    map[TabelDealership.autonomyLevel] = dealership.autonomyLevel;
    map[TabelDealership.password] = dealership.password;

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
      list.add(Admin(
          cpf: item[TabelAdmin.cpf],
          username: item[TabelAdmin.username],
          fullName: item[TabelAdmin.fullname],
          password: item[TabelAdmin.password]));
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
      list.add(Dealership(
          cnpj: item[TabelDealership.cnpj],
          name: item[TabelDealership.name],
          autonomyLevel: item[TabelDealership.autonomyLevel],
          password: item[TabelDealership.password]));
    }

    return list;
  }
}
