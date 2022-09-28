import 'package:flutter/material.dart';

class EmptyTextWidget extends StatelessWidget {
  final double fontSize;
  const EmptyTextWidget({
    super.key,
    required this.fontSize,
  });

  @override
  Widget build(context) {
    return Text(
      '',
      style: TextStyle(
        fontSize: fontSize,
      ),
    );
  }
}
