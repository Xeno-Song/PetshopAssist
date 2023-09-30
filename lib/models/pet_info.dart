import 'datetime_converter.dart';

class PetInfo {
  PetInfo({
    required this.id,
    required this.name,
    required this.type,
    required this.detailType,
    required this.age,
    required this.weight,
    required this.neutering,
    required this.memo,
    required this.customerId,
    required this.createDate,
  });

  int id;
  String name;
  int type;
  String detailType;
  int age;
  int weight;
  int neutering;
  String memo;
  int customerId;
  DateTime createDate;

  static PetInfo create({
    int? id,
    String? name,
    int? type,
    String? detailType,
    int? age,
    int? weight,
    int? neutering,
    String? memo,
    int? customerId,
    DateTime? createDate,
  }) {
    id ??= -1;
    name ??= "";
    type ??= 0;
    detailType ??= "";
    age ??= 0;
    weight ??= 0;
    neutering ??= 0;
    memo ??= "";
    customerId ??= 0;
    createDate ??= DateTime(0, 0, 0, 0, 0, 0);

    return PetInfo(
      id: id,
      name: name,
      type: type,
      detailType: detailType,
      age: age,
      weight: weight,
      neutering: neutering,
      memo: memo,
      customerId: customerId,
      createDate: createDate,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'detail_type': detailType,
      'age': age,
      'weight': weight,
      'neutering': neutering,
      'memo': memo,
      'customer_id': customerId,
      'create_date': DateTimeConverter.format(createDate),
    };
  }

  static PetInfo fromMap(Map<String, Object?> map) {
    return PetInfo.create(
      id: int.parse(map['id'].toString()),
      name: map['departure'].toString(),
      type: int.parse(map['type'].toString()),
      detailType: map['detail_type'].toString(),
      age: int.parse(map['age'].toString()),
      weight: int.parse(map['weight'].toString()),
      neutering: int.parse(map['neutering'].toString()),
      memo: map['memo'].toString(),
      customerId: int.parse(map['customer_id'].toString()),
      createDate: DateTimeConverter.parse(map['create_date'].toString()),
    );
  }
}
