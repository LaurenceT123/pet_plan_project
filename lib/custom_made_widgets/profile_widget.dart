import 'package:flutter/material.dart';
import 'dart:io';

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;
  File? file;

  ProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    required this.onClicked,
    this.file,
  }) : super(key: key);

  Widget build(BuildContext context)
  {
    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(),
          ),
        ]
      ),
    );
  }

  Widget buildImage()
  {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
          child:
          file != null?
          
          GestureDetector(
            child:Image.file(file!, width:110, height:110, fit: BoxFit.cover),
            onTap: onClicked,
          ):
          Ink.image(
            image: image,
            fit: BoxFit.cover,
            width: 120,
            height: 120,
            child: InkWell(onTap: onClicked),
          ),
        ),
    );
  }

  Widget buildEditIcon() => buildCircle(
      color: Colors.white,
      all:3,
      child: buildCircle(
        all: 8,
        color: Colors.blue.shade100,
        child: Icon(
          isEdit ? Icons.add_a_photo: Icons.edit,
          size:20,
        ),
      ),
  );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
  ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: color,
        child: child,
      ),
  );
}