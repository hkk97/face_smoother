import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/interact_demo/interact_custom_paint.dart';

class DTInteractDemoWidget extends StatelessWidget {
  const DTInteractDemoWidget({super.key});

  double widgetHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height < 850 ? 700 : height;
  }

  @override
  Widget build(context) {
    final demoImg = DemoImg.interact();
    return SizedBox(
      height: widgetHeight(context),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height / 20,
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
                          height: constraints.maxHeight,
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
