import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/dt/dt_demo_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/mb/mb_demo_widget.dart';

class DemoWidget extends StatelessWidget {
  final ValueChanged<ProcessImgElement> onDroppedFile;

  const DemoWidget({
    required this.onDroppedFile,
    super.key,
  });

  @override
  Widget build(context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DTDemoWidget(
            onDroppedFile: (processImgElement) =>
                onDroppedFile(processImgElement),
          );
        } else {
          return MBDemoWidget(
            onDroppedFile: (processImgElement) =>
                onDroppedFile(processImgElement),
          );
        }
      },
    );
  }
}
