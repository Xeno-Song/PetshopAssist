class PetType {
  static const int small = 1;
  static const int medium = 2;
  static const int large = 3;
  static const int special = 4;

  static String format(int type) {
    switch (type) {
      case PetType.small:
        return "Small";
      case PetType.medium:
        return "Medium";
      case PetType.large:
        return "Large";
      case PetType.special:
        return "Special";
      default:
        return "";
    }
  }
}
