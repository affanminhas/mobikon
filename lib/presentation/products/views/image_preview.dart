import 'dart:io';

import 'package:flutter/material.dart';

class ImagePreviewArguments {
  final String? image;

  const ImagePreviewArguments({this.image});
}

class ImagePreview extends StatelessWidget {
  static const id = '/image-preview';

  final String? image;

  const ImagePreview({super.key, this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Image.file(
          File(image!),
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
