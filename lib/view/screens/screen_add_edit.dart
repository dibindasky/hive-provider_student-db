import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:student_db/controller/functions/validator_functions.dart';
import 'package:student_db/core/constants.dart';
import 'package:student_db/model/student_model.dart';
import 'package:student_db/controller/provider/studentmodel_provider.dart';

import '../widgets/circle_avathar.dart';
import '../widgets/add_edit/text_field.dart';

enum ActionType {
  add,
  edit,
}

ValueNotifier<File?> image= ValueNotifier<File?>(null);
final TextEditingController nameController = TextEditingController();
final TextEditingController ageController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

class ScreenDetails extends StatelessWidget {
  ScreenDetails({super.key, required this.action, this.model});

  final Student? model;
  final ActionType action;

  @override
  Widget build(BuildContext context) {
    print('build => ()');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: action == ActionType.add
            ? const Text('Add Student')
            : const Text('Edit Student'),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          minimum: const EdgeInsets.all(30),
          child: Form(autovalidateMode: AutovalidateMode.disabled,
            key: formKey,
            child: SizedBox(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  kheight50,
                  InkWell(
                      onTap: () async {
                        await pickImage();
                      },
                      child: ValueListenableBuilder(valueListenable: image,
                        builder: (context,value,child) {
                          return CircleImage(
                            radius: 100,
                            image: image.value?.path,
                          );
                        }
                      )),
                  kheight50,
                  TextFieldItem(
                  
                      function: isAlphabet,
                      size: size,
                      controller: nameController,
                      keyboardType: TextInputType.name,
                      header: 'name'),
                  kheight20,
                  TextFieldItem(
                      function: isValidAge,
                      size: size,
                      controller: ageController,
                      keyboardType: TextInputType.number,
                      header: 'age'),
                  kheight20,
                  TextFieldItem(
                      function: isValidPhoneNumber,
                      size: size,
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      header: 'phone'),
                  kheight20,
                  ElevatedButton.icon(
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        final student = Student(
                          age: ageController.text.trim(),
                          name: nameController.text.trim(),
                          phone: phoneController.text.trim(),
                          image: image.value?.path,
                          id: model?.id
                        );
                       
                        await context
                            .read<StudentModelProvider>()
                            .addOrEdit(student, action == ActionType.edit);
                             Navigator.pop(context);
                        clear();
                      }
                    },
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

  Future<void> pickImage() async {
    XFile? img = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (img != null) {
      image.value = File(img.path);
    }
  }
}

setData(Student model) {
  nameController.text = model.name;
  ageController.text = model.age;
  phoneController.text = model.phone;
  image.value = model.image != null ? File(model.image!): null;
}

clear() {
  nameController.text = '';
  ageController.text = '';
  phoneController.text = '';
  image.value = null;
}
