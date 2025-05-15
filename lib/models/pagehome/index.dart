
class Item {
  final int id;
  final String name;
  final String img;

  Item({
    required this.id,
    required this.name,
    required this.img
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'] ?? '',
      img: json['img'] ?? '',
    );
  }
}
