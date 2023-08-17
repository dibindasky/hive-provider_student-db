import 'package:sqflite/sqflite.dart';

class Sql{
  late Database db;

  db=openDatabase('studrnt.db',version: 1,onCreate: (db, version) async=> await db.execute('CREATE TABLE '),);
}