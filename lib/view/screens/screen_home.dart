import 'package:flutter/material.dart';
import 'package:student_db/controller/db_functions.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/view/screens/screen_add_edit.dart';

import '../../model/student_model.dart';
import '../widgets/list_tile.dart';

ValueNotifier<bool> search = ValueNotifier(false);
String srarchValue = '';

class ScreenHome extends StatelessWidget {
  ScreenHome({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kwhite,
      appBar: AppBar(
        title: ValueListenableBuilder(
          valueListenable: search,
          builder: (context, value, _) {
            return search.value
                ? SearchBar(size: size, searchController: searchController)
                : const Text('Student List');
          },
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: search,
            builder: (context, value, _) => IconButton(
              onPressed: () {
                search.value = !search.value;
              },
              icon: search.value
                  ? const Icon(Icons.arrow_back_ios_new)
                  : const Icon(Icons.search_sharp),
            ),
          ),
          kwidth20
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              kheight10,
              ValueListenableBuilder(
                valueListenable: studentListNotifier,
                builder: (context, value, _) {
                  List<Student> students = value
                      .where((student) => student.name
                          .toLowerCase()
                          .contains(srarchValue.toLowerCase()))
                      .toList();
                  return Expanded(
                    child: ListView.builder(
                      itemCount: students.length,
                      itemBuilder: (context, index) {
                        final Student model = students[index];
                        return ListStudentTile(
                          size: size,
                          model: model,
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kblack,
        foregroundColor: kwhite,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScreenDetails(action: ActionType.add),
              ));
        },
        label: const Text('Add new'),
      ),
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
    required this.size,
    required this.searchController,
  });

  final Size size;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.05,
      decoration: const BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)],
          color: kwhite,
          borderRadius: BorderRadius.all(Radius.circular(50))),
      child: TextField( onChanged: (value) {
        srarchValue=value;
      },
        cursorColor: kblack,
        controller: searchController,
        decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search_sharp),
            prefixIconColor: kblack,
            border: InputBorder.none),
        style: const TextStyle(
            color: kblack, fontWeight: FontWeight.w300, fontSize: 18),
      ),
    );
  }
}
