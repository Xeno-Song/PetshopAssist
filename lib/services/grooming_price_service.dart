import 'package:petshop_assist/models/grooming_price.dart';
import 'package:petshop_assist/services/database_service.dart';

class GroomingPriceService {
  Future<List<GroomingPrice>> findAll() async {
    return DatabaseService.database
        .then((value) => value.rawQuery('SELECT * FROM ${DatabaseService.groomingPriceTable}'))
        .then((value) => List.generate(value.length, (index) => GroomingPrice.fromMap(value[index])));
  }

  Future<List<GroomingPrice>> findByGroomingType(int groomingType) async {
    return DatabaseService.database
        .then((value) =>
            value.rawQuery('SELECT * FROM ${DatabaseService.groomingPriceTable} WHERE grooming_type = $groomingType'))
        .then((value) => List.generate(value.length, (index) => GroomingPrice.fromMap(value[index])));
  }
}
