import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  static var _database;

  static const String customerInfoTable = "customers";
  static const String petInfoTable = "pet_info";
  static const String drivingHistoryTable = "driving_history";
  static const String groomingTypeTable = "grooming_type";
  static const String groomingPriceTable = "grooming_price";

  static Future<Database> get database async {
    if (_database != null) return _database;

    sqfliteFfiInit();
    var databasePath = join((await getApplicationSupportDirectory()).path, "datas.db");
    var database = await databaseFactoryFfi.openDatabase(databasePath);
    _database = database;

    print(databasePath);

    await initializeDatabase();

    return _database;
  }

  static Future<void> initializeDatabase() async {
    // create customer info table
    await createTable(
        customerInfoTable,
        "CREATE TABLE $customerInfoTable ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "call_number TEXT,"
        "memo TEXT);");

    // create pet info table
    await createTable(
        petInfoTable,
        'CREATE TABLE $petInfoTable ('
        'id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,'
        'name TEXT,'
        '"type" INTEGER,'
        'detail_type TEXT,'
        'age INTEGER,'
        'weight INTEGER,'
        'neutering INTEGER,'
        'memo TEXT,'
        'customer_id INTEGER,'
        'create_date TEXT,'
        'CONSTRAINT pet_info_FK FOREIGN KEY (customer_id) REFERENCES $customerInfoTable(id));');

    // create driving history saving table
    await createTable(
        drivingHistoryTable,
        "CREATE TABLE $drivingHistoryTable ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "departure TEXT,"
        "destination TEXT,"
        "price INTEGER,"
        "create_date TEXT,"
        "customer_id INTEGER,"
        "CONSTRAINT driving_history_FK FOREIGN KEY (customer_id) REFERENCES $customerInfoTable(id));");

    // create grooming type table
    await createTable(
        groomingTypeTable,
        "CREATE TABLE $groomingTypeTable ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "name TEXT,"
        "is_option INTEGER);");

    // create grooming price table
    await createTable(
        groomingPriceTable,
        "CREATE TABLE $groomingPriceTable ("
        "id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,"
        "grooming_type INTEGER,"
        "pet_type INTEGER,"
        "weight_limit INTEGER,"
        "price INTEGER,"
        "CONSTRAINT NewTable_FK FOREIGN KEY (grooming_type) REFERENCES $groomingTypeTable(id));");
  }

  static Future<bool> tableExist(String tableName) async {
    return await database
        .then((value) => value.query('sqlite_master', where: 'name = ?', whereArgs: [tableName]))
        .then((value) => value.isNotEmpty);
  }

  static Future<void> createTable(String tableName, String query) async {
    if (!(await tableExist(tableName))) (await database).execute(query);
  }
}
