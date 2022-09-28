import 'package:flutter/material.dart';

class TermTitleWidget extends StatelessWidget {
  final String text;

  const TermTitleWidget({
    required this.text,
    super.key,
  });
  @override
  Widget build(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 30.0,
          color: Colors.black54,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
