import 'package:petshop_assist/models/customer_info.dart';
import 'package:petshop_assist/services/database_service.dart';

class CustomerInfoService {
  CustomerInfoService();

  Future<List<CustomerInfo>> findAll() async {
    return await DatabaseService.database
        .then((value) => value.rawQuery('SELECT * FROM ${DatabaseService.customerInfoTable}'))
        .then((value) => List.generate(value.length, (index) => CustomerInfo.fromMap(value[index])));
  }

  Future<List<CustomerInfo>> findAllDummy() async {
    return [
      CustomerInfo(id: 0, name: "행운", callNumber: "010-1234-5678", memo: ""),
      CustomerInfo(id: 1, name: "미소", callNumber: "010-1234-5678", memo: ""),
      CustomerInfo(id: 2, name: "초롱", callNumber: "010-1234-5678", memo: ""),
      CustomerInfo(id: 3, name: "동백", callNumber: "010-1234-5678", memo: ""),
      CustomerInfo(id: 4, name: "블루", callNumber: "010-1234-5678", memo: ""),
      CustomerInfo(id: 5, name: "모카", callNumber: "010-1234-5678", memo: ""),
      CustomerInfo(id: 6, name: "라떼", callNumber: "010-1234-5678", memo: ""),
    ];
  }

  Future<CustomerInfo?> findById(int id) async {
    return await DatabaseService.database
        .then((value) => value.rawQuery("SELECT * FROM ${DatabaseService.customerInfoTable} WHERE id = $id"))
        .then((value) => List.generate(value.length, (index) => CustomerInfo.fromMap(value[index])))
        .then((value) {
      return value.isNotEmpty ? value[0] : null;
    });
  }
}
