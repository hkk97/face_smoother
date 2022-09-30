import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/util/file_util.dart';
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
                        final beforeImgBuffer = await FileUtil()
                            .readRootBundle(demoImg.beforeImgSrc);
                        final afterImgBuffer = await FileUtil()
                            .readRootBundle(demoImg.afterImgSrc);
                        GoRouter.of(context).go(
                          '/image_process',
                          extra: ProcessImgElement(
                            imgElement: null,
                            processImg: ProcessImg.example(
                              beforeImg: beforeImgBuffer,
                              afterImg: afterImgBuffer,
                              fileSize: await FileUtil()
                                  .fileSize(demoImg.beforeImgSrc),
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              fileLastModifiedDate: DateTime.now(),
                            ), imgSrc: null,
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
                        final beforeImgBuffer = await FileUtil()
                            .readRootBundle(demoImg.beforeImgSrc);
                        final afterImgBuffer = await FileUtil()
                            .readRootBundle(demoImg.afterImgSrc);
                        GoRouter.of(context).go(
                          '/image_process',
                          extra: ProcessImgElement(
                            imgElement: null,
                            processImg: ProcessImg.example(
                              beforeImg: beforeImgBuffer,
                              afterImg: afterImgBuffer,
                              fileSize: await FileUtil()
                                  .fileSize(demoImg.beforeImgSrc),
                              createdAt: DateTime.now(),
                              updatedAt: DateTime.now(),
                              fileLastModifiedDate: DateTime.now(),
                            ), imgSrc: null,
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
