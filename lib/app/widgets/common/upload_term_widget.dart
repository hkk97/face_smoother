import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UploadTermWidget extends StatelessWidget {
  const UploadTermWidget({super.key});

  @override
  Widget build(context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        const Text(
          'By uploading an image or URL, you agree to our ',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).go('/terms'),
          child: const Text(
            'Terms of Service',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const Text(
          ' and its ',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
        GestureDetector(
          onTap: () => GoRouter.of(context).go('/privacy'),
          child: const Text(
            'Privacy Policy',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
        const Text(
          '.',
          style: TextStyle(
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
