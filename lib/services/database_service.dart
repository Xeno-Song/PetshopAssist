import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseService {
  static var _database;

  static const String customerInfoTable = "customers";
  static const String drivingHistoryTable = "driving_history";
  static const String grommingTypeTable = "gromming_type";
  static const String grommingPriceTable = "gromming_price";

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
