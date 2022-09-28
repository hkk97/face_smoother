import 'package:flutter/material.dart';

class PrivacyBodyWidget extends StatelessWidget {
  final String text;

  const PrivacyBodyWidget({
    required this.text,
    super.key,
  });
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 18.5,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
