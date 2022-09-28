import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/dt/dt_intro_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/mb/mb_intro_widget.dart';

class IntroWidget extends StatelessWidget {
  const IntroWidget({super.key});

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const DTIntroWidget();
        } else {
          return const MBIntroWidget();
        }
      },
    );
  }
}
