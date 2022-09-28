import 'package:flutter/material.dart';

class TermBodyWidget extends StatelessWidget {
  final String text;

  const TermBodyWidget({
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
          fontSize: 16.5,
          letterSpacing: 1.0,
          height: 1.5,
        ),
      ),
    );
  }
}
