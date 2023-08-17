import 'dart:io';

class Student {
  String name;
  String age;
  String phone;
  File? image;

  Student(
      {required this.age, required this.name, required this.phone, this.image});

  fromMap(Map<String, dynamic> map) {
    return Student(
      name: map['name'],
      age: map['age'],
      phone: map['phone'],
      image: map['image'] == null ? null : File(map['image']),
    );
  }
}
