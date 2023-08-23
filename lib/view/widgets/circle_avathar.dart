import 'dart:io';

import 'package:flutter/material.dart';

import '../../core/constants.dart';

class CircleImage extends StatelessWidget {
  const CircleImage({super.key, required this.radius, this.image});

  final double radius;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return image != null
        ? CircleAvatar(
            backgroundImage: FileImage(image!),
            radius: radius,
          )
        : CircleAvatar(
            backgroundColor: kblack,
            radius: radius,
            child: Icon(
              Icons.image,
              color: kwhite.withOpacity(0.7),
            ),
          );
  }
}
