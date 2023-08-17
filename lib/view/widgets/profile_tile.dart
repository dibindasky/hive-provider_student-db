import 'package:flutter/material.dart';

import '../../core/constants.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(backgroundColor: kwhite,
          title: CircleAvatar(
            backgroundColor: kblack,
            // backgroundImage: FileImage(image),
            radius: 70,
          ),
          content: SizedBox(
            height: size.height * 0.15,
            child: Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Text('Name   :'),kwidth20,Text('Name ',style: textStyle,)
                  ],
                ),
                kheight10,
                Row(
                  children: [
                    Text('Age       :'),kwidth20, Text('Age',style: textStyle,)
                  ],
                ),
                kheight10,
                Row(
                  children: [
                    Text('Phone   :'),kwidth20,Text('Phone',style: textStyle,)
                  ],
                ),
                Spacer()
              ],
            ),
          ),
        );
  }
}
