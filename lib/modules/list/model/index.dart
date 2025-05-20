class RegisterModel {
  final int id;
  final String name;
  final String img;
  final String status;

  RegisterModel({
    required this.id,
    required this.name,
    required this.img,
    required this.status,
  });

  factory RegisterModel.fromJson(Map<String, dynamic> json) {
    return RegisterModel(
      id: json['id'],
      name: json['name'] ?? '',
      img: json['img'] ?? '',
      status: json['status'],
    );
  }
}