import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/empty_text_widget.dart';

class MBDemoTitleWidget extends StatelessWidget {
  final ValueNotifier<bool> showNotifi;
  final Function onFinished;
  final String text;
  final TextStyle textStyle;
  const MBDemoTitleWidget({
    required this.showNotifi,
    super.key,
    required this.onFinished,
    required this.text,
    this.textStyle = const TextStyle(
      fontSize: 46.0,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  });

  @override
  Widget build(context) {
    return ValueListenableBuilder<bool>(
      valueListenable: showNotifi,
      builder: (context, isShowing, child) {
        return isShowing
            ? AnimatedTextKit(
                totalRepeatCount: 1,
                onFinished: () => onFinished(),
                animatedTexts: [
                  TyperAnimatedText(
                    text,
                    textAlign: TextAlign.center,
                    textStyle: textStyle,
                  )
                ],
              )
            : const EmptyTextWidget(
                fontSize: 30.0,
              );
      },
    );
  }
}
