class GroomingPrice {
  GroomingPrice({
    required this.id,
    required this.groomingType,
    required this.petType,
    required this.weightLimit,
    required this.price,
  });

  int id;
  int groomingType;
  int petType;
  int weightLimit;
  int price;

  static GroomingPrice create({
    int? id,
    int? groomingType,
    int? petType,
    int? weightLimit,
    int? price,
  }) {
    id ??= -1;
    groomingType ??= -1;
    petType ??= -1;
    weightLimit ??= -1;
    price ??= -1;

    return GroomingPrice(
      id: id,
      groomingType: groomingType,
      petType: petType,
      weightLimit: weightLimit,
      price: price,
    );
  }

  Map<String, dynamic> toMap() {
    var map = {
      'id': id,
      'grooming_type': groomingType,
      'pet_type': petType,
      'weight_limit': weightLimit,
      'price': price,
    };

    return map;
  }

  static GroomingPrice fromMap(Map<String, Object?> map) {
    return GroomingPrice.create(
      id: int.parse(map['id'].toString()),
      groomingType: int.parse(map['grooming_type'].toString()),
      petType: int.parse(map['pet_type'].toString()),
      weightLimit: int.parse(map['weight_limit'].toString()),
      price: int.parse(map['price'].toString()),
    );
  }
}
