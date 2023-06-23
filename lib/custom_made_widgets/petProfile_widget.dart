import 'package:flutter/material.dart';

class PetProfileWidget extends StatelessWidget {
  final String imagePath;
  final bool isEdit;
  final VoidCallback onClicked;

  const PetProfileWidget({
    Key? key,
    required this.imagePath,
    this.isEdit = false,
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

  Widget buildImage()
  {
    final image = NetworkImage(imagePath);

    return ClipOval(
      child: Material(
        child:Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 110,
          height: 110,
          child: InkWell(onTap: onClicked),
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