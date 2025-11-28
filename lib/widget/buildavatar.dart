import 'package:flutter/material.dart';

Widget buildAvatar(double leftPadding, String imagePath) {
  return Positioned(
    left: leftPadding,
    child: Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
        image: DecorationImage(
          image: AssetImage(imagePath), 
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}