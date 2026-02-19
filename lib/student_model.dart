class StudentModel {
  int? id;
  String name;
  String email;
  String password;
  int phone;
  String address;


  StudentModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.address,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) {
    return StudentModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      address: json['address'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
      "address": address,
    };
  }
}
