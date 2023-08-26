import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_db/controller/provider/studentmodel_provider.dart';
import 'package:student_db/view/screens/screen_home.dart';

import '../../../core/constants.dart';

  final FocusNode searchFocus = FocusNode();

class SearchBarHome extends StatelessWidget {
  SearchBarHome({
    super.key,
    required this.size,
    required this.searchController,
  });

  final Size size;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: beforeScope,
      child: Container(
        height: size.height * 0.05,
        decoration: const BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 1, spreadRadius: 1)],
            color: kwhite,
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: TextField(
          onChanged: (value) {
            context.read<StudentModelProvider>().getStudents(value);
          },
          focusNode: searchFocus,
          cursorHeight: 15,
          cursorColor: kblack,
          controller: searchController,
          decoration: InputDecoration(
              prefixIcon: const Icon(Icons.search_sharp),
              prefixIconColor: kblack.withOpacity(0.5),
              border: InputBorder.none),
          style: const TextStyle(
              color: kblack, fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ),
    );
  }
}
  Future<bool> beforeScope()async{
   if(search.value==true){
    search.value==false;
    return false;
   }
   return true;
}