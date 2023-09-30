class GroomingType {
  GroomingType({
    required this.id,
    required this.name,
    required this.isOption,
  });

  int id;
  String name;
  int isOption;

  static GroomingType create({
    int? id,
    String? name,
    int? isOption,
  }) {
    id ??= -1;
    name ??= "";
    isOption ??= 0;

    if (isOption != 0) isOption = 1;

    return GroomingType(
      id: id,
      name: name,
      isOption: isOption,
    );
  }

  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'name': name,
      'is_option': isOption,
    };

    return map;
  }

  static GroomingType fromMap(Map<String, Object?> map) {
    return GroomingType.create(
      id: int.parse(map['id'].toString()),
      name: map['name'].toString(),
      isOption: int.parse(map['is_option'].toString()),
    );
  }
}
