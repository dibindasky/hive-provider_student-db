import 'package:flutter/material.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/view/screens/screen_add_edit.dart';

import 'profile_tile.dart';

class ListStudentTile extends StatelessWidget {
  const ListStudentTile({
    super.key,
    required this.size,
    required this.name,
    required this.phone,
  });

  final Size size;
  final String name;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.10,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: kblack.withOpacity(0.05),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Center(
        child: ListTile(
          onTap: () {
            showProfile(context);
          },
          leading: const CircleAvatar(
            backgroundColor: kblack,
            radius: 50,
          ),
          title: Text(name),
          subtitle: Text(phone),
          trailing: Wrap(children: [
            IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ScreenDetails(action: ActionType.edit),
                      ));
                },
                icon: const Icon(Icons.edit_document)),
            const Spacer(),
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.delete_forever_outlined))
          ]),
        ),
      ),
    );
  }

  showProfile(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ProfileTile(size: size),
    );
  }
}
