import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/upload_term_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/drop_zone_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/animated_demo_display_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_body_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_hint_widget.dart';
import 'package:go_router/go_router.dart';

class DTDemoWidget extends StatelessWidget {
  final ValueChanged<ProcessImgElement> onDroppedFile;

  const DTDemoWidget({
    required this.onDroppedFile,
    super.key,
  });

  double widgetHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height < 950 ? 900 : height;
  }

  int leftRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 1600 ? 1 : 4;
  }

  int rightRatio(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width > 1600 ? 1 : 3;
  }

  double leftTopPadding(context) {
    final height = MediaQuery.of(context).size.height;
    return height < 850 ? 0 : MediaQuery.of(context).size.height / 10;
  }

  double rightTopPadding(context) {
    final height = MediaQuery.of(context).size.height;
    return height < 850 ? 135 : 325;
  }

  double imgSectionTopPadding(context) {
    final height = MediaQuery.of(context).size.height;
    return height < 850 ? 20 : 35;
  }

  double termOfServicesTopPadding(context) {
    final width = MediaQuery.of(context).size.width;
    return width > 1510 ? 35 : 10;
  }

  @override
  Widget build(context) {
    final firstDemoImg = DemoImg.demos().first;
    return SizedBox(
      height: widgetHeight(context),
      width: MediaQuery.of(context).size.width,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Row(
          children: [
            Expanded(
              flex: leftRatio(context),
              child: Padding(
                padding: EdgeInsets.only(
                  top: leftTopPadding(context),
                  left: MediaQuery.of(context).size.width / 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        top: 65.0,
                        bottom: 15.0,
                      ),
                      child: Text(
                        "Get Smooth Skin \nwthin Second",
                        style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 56,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 0.0,
                      ),
                      child: Row(
                        children: [
                          const Text(
                            "100% Automatically and ",
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 36,
                            ),
                          ),
                          SizedBox(
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "Free",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 1.0,
                                ),
                                Container(
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                        2,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          const Positioned(
                            top: 20,
                            child: Opacity(
                              opacity: 0.25,
                              child: EnvImgWidget(
                                src: 'dot_bg.webp',
                                height: 350,
                                width: 350,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 50,
                            left: MediaQuery.of(context).size.width / 20,
                            right: 200,
                            height: 450,
                            child: AnimatedDemoDisplayWidget(
                              key: const Key('DT-AnimatedDemoDisplayWidget'),
                              beforeImgSrc: firstDemoImg.beforeImgSrc,
                              afterImgSrc: firstDemoImg.afterImgSrc,
                            ),
                          ),
                          const Positioned(
                            top: 20,
                            right: 0.0,
                            child: EnvImgWidget(
                              width: 150,
                              src: 'arrow_120x120.png',
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: rightRatio(context),
              child: Padding(
                padding: EdgeInsets.only(
                  top: rightTopPadding(context),
                  left: MediaQuery.of(context).size.width / 25,
                  right: MediaQuery.of(context).size.width / 25,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 350.0,
                      width: 400.0,
                      child: DropFileWidget(
                        onDroppedFile: (processImg) async => onDroppedFile(
                          processImg,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: imgSectionTopPadding(context),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const ExampleHintWidget(),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: ExampleBodyWidget(
                                      onTap: (demoImg) async {
                                        ByteData beforeImgByte =
                                            await rootBundle
                                                .load(demoImg.beforeImgSrc);
                                        ByteData afterImgByte = await rootBundle
                                            .load(demoImg.afterImgSrc);
                                        final beforeImgBuffer =
                                            beforeImgByte.buffer.asUint8List();
                                        final afterImgBuffer =
                                            afterImgByte.buffer.asUint8List();
                                        GoRouter.of(context).go(
                                          '/image_process',
                                          extra: ProcessImgElement(
                                            imgElement: null,
                                            processImg: ProcessImg.example(
                                              beforeImg: beforeImgBuffer,
                                              afterImg: afterImgBuffer,
                                              fileSize:
                                                  beforeImgByte.lengthInBytes,
                                              createdAt: DateTime.now(),
                                              updatedAt: DateTime.now(),
                                              fileLastModifiedDate:
                                                  DateTime.now(),
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                top: termOfServicesTopPadding(context),
                              ),
                              child: const UploadTermWidget(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
