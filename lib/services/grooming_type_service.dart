import 'package:petshop_assist/services/database_service.dart';

import '../models/grooming_type.dart';

class GroomingTypeService {
  Future<List<GroomingType>> findAll() async {
    return DatabaseService.database
        .then((value) => value.rawQuery('SELECT * FROM ${DatabaseService.groomingTypeTable}'))
        .then((value) => List.generate(value.length, (index) => GroomingType.fromMap(value[index])));
  }
}
