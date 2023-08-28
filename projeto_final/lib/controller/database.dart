import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:projeto_final/entities/user.dart';
import 'package:projeto_final/entities/dealership.dart';

Future<Database> getDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'anderson.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TabelUser.createTable);
    },
    version: 1,
  );
}

class TabelUser {
  static const String createTable = '''
  CREATE TABLE $tableName (
  $id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  $username TEXT NOT NULL,
  $fullname TEXT NOT NULL,
  $password TEXT NOT NULL,
  $userType INTEGER NOT NULL
  );
''';

  static const String tableName = 'user';

  static const String id = 'id';
  static const String username = 'username';
  static const String fullname = 'fullname';
  static const String password = 'password';
  static const String userType = '0';

  static Map<String, dynamic> toMap(User user) {
    final map = <String, dynamic>{};

    map[TabelUser.id] = user.id;
    map[TabelUser.username] = user.username;
    map[TabelUser.fullname] = user.fullName;
    map[TabelUser.password] = user.password;
    map[TabelUser.userType] = user.userType;

    return map;
  }
}

class TabelDealership {
  static const String createTable = '''
  CREATE TABLE $tablename (
  $cnpj INTEGER PRIMARY KEY NOT NULL,
  $name TEXT NOT NULL,
  $autonomyLevel TEXT NOT NULL,
  $password TEXT NOT NULL,
  );
''';

  static const String tablename = 'dealership';

  static const String cnpj = "cnpj";
  static const String name = "name";
  static const String autonomyLevel = "autonomy level";
  static const String password = "password";

  static Map<String, dynamic> toMap(Dealership dealership) {
    final map = <String, dynamic>{};

    map[TabelDealership.cnpj] = dealership.cnpj;
    map[TabelDealership.name] = dealership.name;
    map[TabelDealership.autonomyLevel] = dealership.autonomyLevel;
    map[TabelDealership.password] = dealership.password;

    return map;
  }
}

class UserController {
  Future<void> insert(User user) async {
    final database = await getDatabase();
    final map = TabelUser.toMap(user);

    await database.insert(TabelUser.tableName, map);

    return;
  }
}

class DealershipController {
  Future<void> insert(Dealership dealership) async {
    final database = await getDatabase();
    final map = TabelDealership.toMap(dealership);

    await database.insert(TabelDealership.tablename, map);

    return;
  }
}
