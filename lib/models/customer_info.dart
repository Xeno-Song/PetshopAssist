class CustomerInfo {
  CustomerInfo({
    required this.id,
    required this.name,
    required this.callNumber,
    required this.memo,
  });

  int id;
  String name;
  String callNumber;
  String memo;

  static CustomerInfo create({int? id, String? name, String? callNumber, String? memo}) {
    id ??= -1;
    name ??= "";
    callNumber ??= "";
    memo ??= "";

    return CustomerInfo(
      id: id,
      name: name,
      callNumber: callNumber,
      memo: memo,
    );
  }

  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'name': name,
      'call_number': callNumber,
      'memo': memo,
    };

    return map;
  }

  static CustomerInfo fromMap(Map<String, Object?> map) {
    return CustomerInfo.create(
      id: int.parse(map['id'].toString()),
      name: map['name'].toString(),
      callNumber: map['call_number'].toString(),
      memo: map['memo'].toString(),
    );
  }
}
