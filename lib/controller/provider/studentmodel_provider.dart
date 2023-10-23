
import 'package:flutter/material.dart';
import 'package:student_db/controller/db/db_functions.dart';
import 'package:student_db/model/student_model.dart';

class StudentModelProvider with ChangeNotifier {
  HiveDb hive = HiveDb();
  List<Student> studentList = [];

  Future<void> getStudents(String name) async {
    List<Student> tempList = await hive.getData();
    studentList = tempList
        .where((model) => model.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> addOrEdit(Student model, bool toEdit) async{
    toEdit ?await editModel(model) :await addModel(model);
  }

  Future<void> deleteModel(int id) async {
    await hive.deleteData(id);
    await getStudents('');
  }

  Future<void> addModel(Student model) async {
    await hive.insertInToDb(model);
    await getStudents('');
  }

  Future<void> editModel(Student model) async {
    await hive.updateTable(model);
    await getStudents('');
  }
}
