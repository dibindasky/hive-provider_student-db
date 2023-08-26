
import 'package:flutter/material.dart';
import 'package:student_db/controller/db/db_functions.dart';
import 'package:student_db/model/student_model.dart';

class StudentModelProvider with ChangeNotifier {
  Sql sql = Sql();
  List<Student> studentList = [];

  Future<void> getStudents(String name) async {
    List<Student> tempList = await sql.getData();
    studentList = tempList
        .where((model) => model.name.toLowerCase().contains(name.toLowerCase()))
        .toList();
    notifyListeners();
  }

  Future<void> addOrEdit(Student model, bool toEdit,[String phone='']) async{
    toEdit ?await editModel(model,phone) :await addModel(model);
  }

  Future<void> deleteModel(int id) async {
    await sql.deleteData(id);
    await getStudents('');
  }

  Future<void> addModel(Student model) async {
    await sql.insertInToDb(model);
    await getStudents('');
  }

  Future<void> editModel(Student model,String phone) async {
    await sql.updateTable(model,phone);
    await getStudents('');
  }
}
