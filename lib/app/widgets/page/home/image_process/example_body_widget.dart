import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/on_hover_trans_widget.dart';

class ExampleBodyWidget extends StatelessWidget {
  final Function(DemoImg demoImg) onTap;
  final WrapAlignment alignment;
  final WrapAlignment runAlignment;
  final WrapCrossAlignment crossAxisAlignment;
  final double spacing;
  final double runSpacing;

  const ExampleBodyWidget({
    required this.onTap,
    this.alignment = WrapAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.crossAxisAlignment = WrapCrossAlignment.center,
    this.spacing = 12.5,
    this.runSpacing = 12.5,
    super.key,
  });

  @override
  Widget build(context) {
    return Wrap(
      alignment: alignment,
      runAlignment: runAlignment,
      crossAxisAlignment: crossAxisAlignment,
      spacing: spacing,
      runSpacing: runSpacing,
      children: DemoImg.demos()
          .map(
            (demo) => GestureDetector(
              onTap: () => onTap(demo),
              child: OnHoverTransWidget(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(
                      10.0,
                    ),
                  ),
                  child: EnvImgWidget(
                    height: 65,
                    width: 65,
                    boxFit: BoxFit.cover,
                    src: demo.beforeImgSrc,
                  ),
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
