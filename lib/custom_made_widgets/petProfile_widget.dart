import 'package:flutter/material.dart';
import 'dart:io';

class PetProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  bool isSelected;
  File? file;
  final VoidCallback onClicked;

  PetProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
    this.isSelected = false,
    this.file,
    required this.onClicked,
  }) : super(key: key);

  Widget build(BuildContext context)
  {
    return Center(
      child: Stack(
          children: [
            buildImage(),
          ]
      ),
    );
  }
  
  void setIsSelected(bool value)
  {
    isSelected = value;
  }

  Widget buildImage()
  {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Container(
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
            width: 110,
            height: 110,
            child: InkWell(onTap: onClicked),
          ),
        ),
      ),
    );
  }

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