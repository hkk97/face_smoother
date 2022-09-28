import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/upload_term_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_body_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_hint_widget.dart';
import 'package:go_router/go_router.dart';

class MBExampleBodyWidget extends StatelessWidget {
  const MBExampleBodyWidget({super.key});

  @override
  Widget build(context) {
    final onVertical = MediaQuery.of(context).size.width < 650;
    return onVertical
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 30.0,
                      bottom: 20.0,
                    ),
                    child: ExampleHintWidget(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: ExampleBodyWidget(
                      onTap: (demoImg) async {
                        ByteData beforeImgByte =
                            await rootBundle.load(demoImg.beforeImgSrc);
                        ByteData afterImgByte =
                            await rootBundle.load(demoImg.afterImgSrc);
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
                              fileSize: beforeImgByte.lengthInBytes,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              fileLastModifiedDate: DateTime.now(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25, left: 35, right: 35),
                child: UploadTermWidget(),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ExampleHintWidget(),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0),
                    child: ExampleBodyWidget(
                      onTap: (demoImg) async {
                        ByteData beforeImgByte =
                            await rootBundle.load(demoImg.beforeImgSrc);
                        ByteData afterImgByte =
                            await rootBundle.load(demoImg.afterImgSrc);
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
                              fileSize: beforeImgByte.lengthInBytes,
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              fileLastModifiedDate: DateTime.now(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 25),
                child: UploadTermWidget(),
              ),
            ],
          );
  }
}
