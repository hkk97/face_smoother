import 'package:flutter/material.dart';

class TextStatusHightlightWidget extends StatelessWidget {
  final ValueNotifier<bool> statusNotifi;
  final String text;
  final double width;
  final String tooltip;
  final EdgeInsetsGeometry padding;
  const TextStatusHightlightWidget({
    this.padding = EdgeInsets.zero,
    required this.text,
    required this.width,
    required this.tooltip,
    required this.statusNotifi,
    super.key,
  });

  @override
  Widget build(context) {
    return Padding(
      padding: padding,
      child: Tooltip(
        message: tooltip,
        padding: const EdgeInsets.all(7.5),
        child: SizedBox(
          width: width,
          child: ValueListenableBuilder<bool>(
            valueListenable: statusNotifi,
            builder: (context, hasLoaded, child) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: hasLoaded ? Colors.green : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 3.5,
                  ),
                  Container(
                    height: 3,
                    decoration: BoxDecoration(
                      color: hasLoaded ? Colors.green : Colors.grey,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          2,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
