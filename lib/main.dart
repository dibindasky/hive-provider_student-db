import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/controller/provider/studentmodel_provider.dart';
import 'package:student_db/model/student_model.dart';
import 'package:student_db/view/screens/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(StudentAdapter().typeId)){
    Hive.registerAdapter(StudentAdapter());
  }

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
