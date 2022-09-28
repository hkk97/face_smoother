import 'dart:typed_data';
import 'package:flutter/material.dart';

class ImgProcessImgWidget extends StatelessWidget {
  final bool showOrigin;
  final Uint8List? afterImg;
  final Uint8List? beforeImg;

  const ImgProcessImgWidget({
    required this.showOrigin,
    required this.afterImg,
    required this.beforeImg,
    super.key,
  });

  @override
  Widget build(context) {
    if (showOrigin) {
      return beforeImg == null
          ? const SizedBox()
          : Image.memory(
              beforeImg!,
              fit: BoxFit.scaleDown,
            );
    } else {
      return afterImg == null
          ? const SizedBox()
          : Image.memory(
              afterImg!,
              fit: BoxFit.scaleDown,
            );
    }
  }
}
