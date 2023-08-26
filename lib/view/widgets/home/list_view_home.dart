import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_db/controller/provider/studentmodel_provider.dart';
import 'package:student_db/view/widgets/home/list_tile.dart';

import '../../../model/student_model.dart';

class ListViewHome extends StatelessWidget {
  const ListViewHome({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<StudentModelProvider>().getStudents('');
    return Consumer<StudentModelProvider>(
      builder: (context, value, child) => ListView.builder(
        shrinkWrap: true,
        itemCount: value.studentList.length,
        itemBuilder: (context, index) {
          final Student model = value.studentList[index];
          return ListStudentTile(
            model: model,
          );
        },
      ),
    );
  }
}
