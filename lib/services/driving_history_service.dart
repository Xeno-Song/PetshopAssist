import 'package:petshop_assist/models/driving_history.dart';
import 'package:petshop_assist/services/database_service.dart';

class DrivingHistoryService {
  Future<List<DrivingHistory>> findAll() async {
    return await DatabaseService.database
        .then((value) => value.rawQuery('SELECT * FROM ${DatabaseService.drivingHistoryTable}'))
        .then((value) => List.generate(value.length, (index) => DrivingHistory.fromMap(value[index])));
  }

  Future<DrivingHistory?> findByCustomerId(int customerId) async {
    return await DatabaseService.database
        .then((value) =>
            value.rawQuery('SELECT * FROM ${DatabaseService.drivingHistoryTable} WHERE customer_id = $customerId'))
        .then((value) => List.generate(value.length, (index) => DrivingHistory.fromMap(value[index])))
        .then(
      (value) {
        if (value.isEmpty) return null;
        return value[0];
      },
    );
  }

  Future<DrivingHistory?> findByCustomerIdOrderByDateWithLimit(int customerId,
      {bool isDesc = true, int limit = 1}) async {
    String order = isDesc ? "DESC" : "ASC";

    return await DatabaseService.database
        .then((value) => value.rawQuery('SELECT * FROM ${DatabaseService.drivingHistoryTable} '
            'WHERE customer_id = $customerId ORDER BY create_date $order LIMIT $limit'))
        .then((value) => List.generate(value.length, (index) => DrivingHistory.fromMap(value[index])))
        .then(
      (value) {
        if (value.isEmpty) return null;
        return value[0];
      },
    );
  }
}
