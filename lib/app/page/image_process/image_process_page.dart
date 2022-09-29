import 'dart:async';
import 'dart:html' as html;
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/util/file_util.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/custom_appbar/custom_appbar.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/upload_term_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/drop_zone_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/img_process_list_view/img_process_list_view.dart';

class ImageProcessPage extends StatefulWidget {
  final ProcessImgElement? processImgElement;
  const ImageProcessPage({
    super.key,
    required this.processImgElement,
  });

  @override
  State<ImageProcessPage> createState() => _ImageProcessState();
}

class _ImageProcessState extends State<ImageProcessPage> with AfterLayoutMixin {
  late ProcessImgElement? currImgElement;
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    if (widget.processImgElement != null) {
      currImgElement = widget.processImgElement!;
    }
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 500 ? 15 : width / 2 - 400 / 2;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          loadScriptNotifi: AppSer().faceSmoother().loadScriptNotifi,
        ),
        body: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 35, bottom: 25),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding(context),
                        ),
                        child: SizedBox(
                          height: 350.0,
                          width: 400.0,
                          child: DropFileWidget(
                            onDroppedFile: (processImgElement) async {
                              if (processImgElement.imgElement != null) {
                                currImgElement = processImgElement;
                                await smoothFilter(
                                  imageElement: processImgElement.imgElement!,
                                  context: context,
                                  imgCallBack: (uin8List) async {
                                    await AppSer().dbSer().imgDBSer().update(
                                          prcessImg: currImgElement!.processImg
                                              .copyWith(uin8List),
                                        );
                                  },
                                );
                              } else {}
                            },
                          ),
                        ),
                      ),
                    ),
                    ExampleWidget(
                      onTap: (demoImg) async {
                        final beforeImgBuffer = await FileUtil()
                            .readRootBundle(demoImg.beforeImgSrc);
                        final afterImgBuffer = await FileUtil()
                            .readRootBundle(demoImg.afterImgSrc);
                        await AppSer().dbSer().imgDBSer().write(
                              img: ProcessImg.example(
                                beforeImg: beforeImgBuffer,
                                afterImg: afterImgBuffer,
                                createdAt: DateTime.now(),
                                updatedAt: DateTime.now(),
                                fileSize: await FileUtil()
                                    .fileSize(demoImg.beforeImgSrc),
                                fileLastModifiedDate: DateTime.now(),
                              ),
                            );
                      },
                      inVertical: MediaQuery.of(context).size.width < 1000,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        bottom: 25.0,
                      ),
                      child: UploadTermWidget(),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: ImageProcessListView(),
        ),
      ),
    );
  }

  Future<void> smoothFilter({
    required html.ImageElement imageElement,
    required BuildContext context,
    required ValueChanged<Uint8List?> imgCallBack,
  }) async =>
      await AppSer().faceSmoother().smoothFilter(
            file: imageElement,
            context: context,
            imgCallBack: imgCallBack,
          );

  @override
  FutureOr<void> afterFirstLayout(context) async {
    if (widget.processImgElement != null) {
      if (widget.processImgElement!.processImg.isExample) {
        await AppSer().dbSer().imgDBSer().write(
              img: ProcessImg.example(
                beforeImg: widget.processImgElement!.processImg.beforeImg,
                afterImg: widget.processImgElement!.processImg.afterImg,
                createdAt: DateTime.now(),
                fileSize: widget.processImgElement!.processImg.fileSize,
                updatedAt: DateTime.now(),
                fileLastModifiedDate: DateTime.now(),
              ),
            );
      } else {
        if (widget.processImgElement!.processImg.isValidMedia &&
            widget.processImgElement!.imgElement != null) {
          await smoothFilter(
            imageElement: widget.processImgElement!.imgElement!,
            context: context,
            imgCallBack: (uin8List) async {
              await AppSer().dbSer().imgDBSer().update(
                    prcessImg: currImgElement!.processImg.copyWith(uin8List),
                  );
            },
          );
        }
      }
    }
  }
}
