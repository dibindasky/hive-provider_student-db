import 'package:flutter/material.dart';
import 'package:student_db/controller/validator_functions.dart';
import 'package:student_db/core/constants.dart';

import '../widgets/text_field.dart';

enum ActionType {
  add,
  edit,
}

class ScreenDetails extends StatelessWidget {
  ScreenDetails({super.key, required this.action});

  final ActionType action;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: action==ActionType.add ? const Text('Add Student') :const Text('Edit Student'),),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(30),
          child: Form(
            key: formKey,
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kheight50,
                  InkWell(
                    onTap: () {},
                    child: const CircleAvatar(
                      backgroundColor: kblack,
                      radius: 100,
                      child: Icon(
                        Icons.image,
                        color: kwhite,
                      ),
                    ),
                  ),
                  kheight50,
                  TextFieldItem(function: isAlphabet,
                      size: size,controller: nameController,keyboardType: TextInputType.name,header: 'name'),
                  kheight20,
                  TextFieldItem(function: isValidAge,
                      size: size, controller: ageController,keyboardType: TextInputType.number, header: 'age'),
                  kheight20,
                  TextFieldItem(function: isValidPhoneNumber,
                      size: size,controller: phoneController,keyboardType: TextInputType.phone,header: 'phone'),
                  kheight20,
                  ElevatedButton.icon(
                    onPressed: () {if(formKey.currentState!.validate())checkStudent();},
                    icon: action == ActionType.add
                        ? const Icon(Icons.check)
                        : const Icon(Icons.upload_file),
                    label: action == ActionType.add
                        ? const Text('add')
                        : const Text('update'),
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(kblack),
                      foregroundColor: MaterialStatePropertyAll(kwhite),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
checkStudent(){
  
}
}

