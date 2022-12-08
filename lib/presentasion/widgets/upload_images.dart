import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../provider/color_custom.dart';

class uploadImage extends StatefulWidget {
  const uploadImage({
    Key? key,
  }) : super(key: key);

  @override
  State<uploadImage> createState() => _uploadImageState();
}

class _uploadImageState extends State<uploadImage> {
  String imageUrl = " ";
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pickUpload();
      },
      child: CircleAvatar(
        radius: 30,
        child: imageUrl == " "
            ? Image.asset("assets/images/user.png")
            : Image.network(imageUrl),
      ),
      // child: Container(
      //   width: 80,
      //   height: 80,
      //   decoration: BoxDecoration(
      //     shape: BoxShape.circle,
      //        color: primaryColor),
      //   child: Center(
      //     child: imageUrl == " "
      //         ? Image.asset("assets/images/user.png")
      //         : Image.network(imageUrl),
      //   ),
      // ),
    );
  }

  void pickUpload() async {
    final image = await ImagePicker()
        .pickImage(source: ImageSource.gallery, imageQuality: 100);
    Reference ref = FirebaseStorage.instance.ref("assets/images/user.png");
    await ref.putFile(
      File(image!.path),
    );
    ref.getDownloadURL().then((value) {
      setState(() {
        imageUrl = value;
      });
      print(value);
    });
  }
}
