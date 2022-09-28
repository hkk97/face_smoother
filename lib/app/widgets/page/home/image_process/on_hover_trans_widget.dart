import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class OnHoverTransWidget extends StatefulWidget {
  final Widget child;
  const OnHoverTransWidget({
    required this.child,
    super.key,
  });

  @override
  State<OnHoverTransWidget> createState() => _OnHoverTransState();
}

class _OnHoverTransState extends State<OnHoverTransWidget> {
  late ValueNotifier<bool> hoverNotifi;

  @override
  void initState() {
    hoverNotifi = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    hoverNotifi.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return MouseRegion(
      onEnter: (event) => hoverNotifi.value = true,
      onExit: (event) => hoverNotifi.value = false,
      child: ValueListenableBuilder<bool>(
        valueListenable: hoverNotifi,
        builder: (context, isHover, child) {
          return Opacity(
            opacity: isHover ? 0.5 : 1.0,
            child: isHover
                ? DottedBorder(
                    borderType: BorderType.RRect,
                    color: Colors.black,
                    strokeWidth: 5,
                    dashPattern: const [4, 4],
                    radius: const Radius.circular(10),
                    padding: EdgeInsets.zero,
                    child: child!,
                  )
                : child!,
          );
        },
        child: widget.child,
      ),
    );
  }
}
