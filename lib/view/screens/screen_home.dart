import 'package:flutter/material.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/view/screens/screen_add_edit.dart';

import '../widgets/home/list_view_home.dart';
import '../widgets/home/search_bar.dart';

ValueNotifier<bool> search = ValueNotifier(false);

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
                ? SearchBarHome(size: size, searchController: searchController)
                : const Text('Student List');
          },
        ),
        actions: [
          ValueListenableBuilder(
            valueListenable: search,
            builder: (context, value, _) => IconButton(
              onPressed: () {
                search.value = !search.value;
                FocusScope.of(context).requestFocus(searchFocus);
              },
              icon: search.value
                  ? const Icon(Icons.arrow_back_ios_new)
                  : const Icon(Icons.search_sharp),
            ),
          ),
          kwidth20
        ],
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListViewHome(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kblack,
        foregroundColor: kwhite,
        onPressed: () {
          clear();
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
