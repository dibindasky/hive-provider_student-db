import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_db/controller/db_functions.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/provider/studentmodel_provider.dart';
import 'package:student_db/view/screens/screen_add_edit.dart';
import 'package:student_db/view/widgets/circle_avathar.dart';

import '../../../model/student_model.dart';
import '../profile_tile.dart';

ValueNotifier<bool> isDeleting = ValueNotifier<bool>(false);

class ListStudentTile extends StatelessWidget {
  ListStudentTile({super.key, required this.model});

  final Student model;
  final Sql sql = Sql();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.10,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kblack.withOpacity(0.05),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: ListTile(
          onTap: () {
            showProfile(context: context, model: model);
          },
          leading: CircleImage(
            radius: 50,
            image: model.image,
          ),
          title: Text(model.name),
          subtitle: Text(model.phone),
          trailing: Wrap(children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ScreenDetails(
                        action: ActionType.edit,
                        model: model,
                      ),
                    ),
                  );
                  setData(model);
                },
                icon: const Icon(Icons.edit_document)),
            IconButton(
                onPressed: () async {
                  await context
                      .read<StudentModelProvider>()
                      .deleteModel(model.id!);
                },
                icon: const Icon(Icons.delete_forever_outlined))
          ]),
        ),
      ),
    );
  }

  showProfile({required BuildContext context, required Student model}) {
    showDialog(
      context: context,
      builder: (context) => ProfileTile(model: model),
    );
  }
}
