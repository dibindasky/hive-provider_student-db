import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_db/controller/db_functions.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/provider/studentmodel_provider.dart';
import 'package:student_db/view/screens/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Sql sql = Sql();
  await sql.initialiseDatabase();

  runApp(
    ChangeNotifierProvider(
      create: (_) => StudentModelProvider(),
      child: const StudentApp(),
    ),
  );
}

class StudentApp extends StatelessWidget {
  const StudentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          canvasColor: kwhite,
          primaryColor: Colors.blueAccent,
          appBarTheme: const AppBarTheme(
              backgroundColor: kblack,
              centerTitle: true,
              foregroundColor: kwhite,
              iconTheme: IconThemeData(color: kwhite))),
      home: ScreenHome(),
    );
  }
}
