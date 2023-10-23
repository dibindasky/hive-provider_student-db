import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class Student {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String age;
  @HiveField(3)
  String phone;
  @HiveField(4)
  String? image;

  Student(
      {required this.age,
      required this.name,
      required this.phone,
      this.image,
      required this.id});

  // static Student fromMap(Map<String, Object?> map) {
  //   return Student(
  //     id: map['id'] as int,
  //     name: map['name'] as String,
  //     age: map['age'] as String,
  //     phone: map['phone'] as String,
  //     image: map['image'] as String == '' ? null : File(map['image'] as String),
  //   );
  // }
}
