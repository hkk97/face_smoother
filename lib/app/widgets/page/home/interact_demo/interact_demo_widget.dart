import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/interact_demo/dt/dt_interact_demo_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/interact_demo/mb/mb_interact_demo_widget.dart';

class InteractDemoWidget extends StatelessWidget {
  const InteractDemoWidget({super.key});

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return const DTInteractDemoWidget();
        } else {
          return const MBInteractDemoWidget();
        }
      },
    );
  }
}
