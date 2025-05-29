import 'dart:io';
import 'package:flutter/material.dart';


class ImageContainer extends StatelessWidget {
  const ImageContainer({super.key, this.pickedImage, required this.onTap});

  final File? pickedImage;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
    alignment: Alignment.bottomLeft,
    child: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.file(
              pickedImage!,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.close,
                color: Colors.white,
                size: 18,
              ),
            ),
          ),
        ),
      ],
    ),
  );
  }
}