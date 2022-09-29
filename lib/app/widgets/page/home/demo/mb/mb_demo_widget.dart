import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/animated_demo_display_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/mb/mb_drop_file_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/mb/mb_example_body_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/mb/mb_subtitle_widget.dart';

class MBDemoWidget extends StatelessWidget {
  final ValueChanged<ProcessImgElement> onDroppedFile;

  const MBDemoWidget({
    required this.onDroppedFile,
    super.key,
  });

  double widgetHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 400
        ? 500
        : width < 650
            ? 600
            : 750;
  }

  double titleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 400
        ? 35
        : width < 650
            ? 45
            : 56;
  }

  double? dotBgPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 450 ? 25 : null;
  }

  double animatedWidgetPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width /
        (width < 460
            ? 6
            : width < 550
                ? 5
                : 4);
  }

  @override
  Widget build(context) {
    final firstDemoImg = DemoImg.demos().first;
    return Column(
      children: [
        SizedBox(
          height: widgetHeight(context),
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 10.0,
                    ),
                    child: Text(
                      "Get Smooth Skin \nwthin Second",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                        fontSize: titleFontSize(context),
                      ),
                    ),
                  ),
                  const MBSubtitleWidget(),
                  Expanded(
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: 20,
                          left: dotBgPadding(context),
                          right: dotBgPadding(context),
                          child: const Opacity(
                            opacity: 0.25,
                            child: EnvImgWidget(
                              src: 'dot_bg.webp',
                              height: 350,
                              width: 350,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 50,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: animatedWidgetPadding(context),
                            ),
                            child: AnimatedDemoDisplayWidget(
                              key: const Key('MB-AnimatedDemoDisplayWidget'),
                              beforeImgSrc: firstDemoImg.beforeImgSrc,
                              afterImgSrc: firstDemoImg.afterImgSrc,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        MBDropFileWidget(
          onDroppedFile: onDroppedFile,
        ),
        const MBExampleBodyWidget(),
      ],
    );
  }
}
