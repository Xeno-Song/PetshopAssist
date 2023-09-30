import 'package:petshop_assist/models/datetime_converter.dart';

class DrivingHistory {
  DrivingHistory({
    required this.id,
    required this.departure,
    required this.destination,
    required this.price,
    required this.createDate,
    required this.customerId,
  });

  int id;
  String departure;
  String destination;
  int price;
  DateTime createDate;
  int customerId;

  static DrivingHistory create(
      {int? id, String? departure, String? destination, int? price, DateTime? createDate, int? customerId}) {
    id ??= -1;
    departure ??= "";
    destination ??= "";
    price ??= 0;
    createDate ??= DateTime(0, 0, 0, 0, 0, 0);
    customerId ??= -1;

    return DrivingHistory(
      id: id,
      departure: departure,
      destination: destination,
      price: price,
      createDate: createDate,
      customerId: customerId,
    );
  }

  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'departure': departure,
      'destination': destination,
      'price': price,
      'create_date': DateTimeConverter.format(createDate),
      'customer_id': customerId,
    };

    return map;
  }

  static DrivingHistory fromMap(Map<String, Object?> map) {
    return DrivingHistory.create(
      id: int.parse(map['id'].toString()),
      departure: map['departure'].toString(),
      destination: map['destination'].toString(),
      price: int.parse(map['price'].toString()),
      createDate: DateTimeConverter.parse(map['create_date'].toString()),
      customerId: int.parse(map['customer_id'].toString()),
    );
  }
}
