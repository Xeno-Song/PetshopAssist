import 'package:petshop_assist/models/pet_info.dart';
import 'package:petshop_assist/services/database_service.dart';

class PetInfoService {
  Future<List<PetInfo>> findAll() async {
    return DatabaseService.database
        .then((value) => value.rawQuery('SELECT * FROM ${DatabaseService.petInfoTable}'))
        .then((value) => List.generate(value.length, (index) => PetInfo.fromMap(value[index])));
  }

  Future<List<PetInfo>> findByCustomerIdEquals(int customerId) async {
    return DatabaseService.database
        .then(
            (value) => value.rawQuery('SELECT * FROM ${DatabaseService.petInfoTable} WHERE customer_id = $customerId'))
        .then((value) => List.generate(value.length, (index) => PetInfo.fromMap(value[index])));
  }
}
