import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/interact_demo/interact_custom_paint.dart';

class MBInteractDemoWidget extends StatelessWidget {
  const MBInteractDemoWidget({super.key});

  double widgetHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 750 ? width * 0.85 : width * 0.90;
  }

  double verticalPaddingFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 750 ? 20 : 5;
  }

  @override
  Widget build(context) {
    final demoImg = DemoImg.interact();
    return SizedBox(
      height: widgetHeight(context),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: widgetHeight(context) / verticalPaddingFactor(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Amazing Quality",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 46.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(
                  top: 50,
                  bottom: MediaQuery.of(context).size.height / 20,
                  left: MediaQuery.of(context).size.width / 5,
                  right: MediaQuery.of(context).size.width / 5,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return RepaintBoundary(
                      child: CustomPaint(
                        foregroundPainter: InteractCustomPaint(),
                        isComplex: true,
                        child: SizedBox(
                          width: constraints.maxWidth,
                          height: widgetHeight(context),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: EnvImgWidget(
                                  src: demoImg.beforeImgSrc,
                                ),
                              ),
                              Expanded(
                                child: EnvImgWidget(
                                  src: demoImg.afterImgSrc,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
