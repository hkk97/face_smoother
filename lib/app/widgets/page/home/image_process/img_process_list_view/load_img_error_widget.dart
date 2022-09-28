import 'package:flutter/material.dart';

class LoadImgErrorWidget extends StatelessWidget {
  const LoadImgErrorWidget({super.key});

  @override
  Widget build(context) {
    return const Center(
      child: Text(
        "Failed to load Image",
        style: TextStyle(
          color: Colors.black,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
