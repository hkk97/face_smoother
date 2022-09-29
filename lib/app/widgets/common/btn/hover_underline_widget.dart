import 'package:flutter/material.dart';

class HoverUnderlineWidget extends StatefulWidget {
  final String text;
  final bool isSelect;
  final Function onTap;

  const HoverUnderlineWidget({
    required this.text,
    required this.isSelect,
    required this.onTap,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _HoverUnderlineState();
}

class _HoverUnderlineState extends State<HoverUnderlineWidget> {
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

  double fontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 550 ? 18 : 24;
  }

  @override
  Widget build(context) {
    return GestureDetector(
      onTap: () => widget.onTap(),
      child: MouseRegion(
        onEnter: (event) => hoverNotifi.value = true,
        onExit: (event) => hoverNotifi.value = false,
        child: ValueListenableBuilder<bool>(
          valueListenable: hoverNotifi,
          builder: (context, isHover, child) {
            return Padding(
              padding: const EdgeInsets.all(8.5),
              child: Text(
                widget.text,
                style: TextStyle(
                  color: widget.isSelect
                      ? Colors.blue
                      : isHover
                          ? Colors.blue
                          : Colors.black,
                  fontWeight:
                      widget.isSelect ? FontWeight.bold : FontWeight.normal,
                  fontSize: fontSize(context),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
