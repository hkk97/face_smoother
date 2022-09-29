import 'package:flutter/material.dart';

class CustomScrollBar extends StatelessWidget {
  final Widget child;
  final ScrollController scrollController;
  const CustomScrollBar({
    required this.child,
    required this.scrollController,
    super.key,
  });

  @override
  Widget build(context) {
    return RawScrollbar(
      controller: scrollController,
      thumbColor: Colors.greenAccent,
      thickness: 5,
      radius: const Radius.circular(20),
      thumbVisibility: true,
      child: child,
    );
  }
}
