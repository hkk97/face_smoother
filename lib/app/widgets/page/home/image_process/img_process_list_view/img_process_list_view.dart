import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/img_process_list_view/img_process_card_widget.dart';

class ImageProcessListView extends StatelessWidget {
  const ImageProcessListView({super.key});

  @override
  Widget build(context) {
    return ValueListenableBuilder<List<ProcessImg>?>(
      valueListenable: AppSer().dbSer().imgDBSer().imgsNotifi(),
      builder: ((context, imgs, child) {
        return imgs == null || imgs.isEmpty
            ? const SizedBox()
            : Padding(
                padding: const EdgeInsets.only(
                  bottom: 25.0,
                ),
                child: ListView.custom(
                  cacheExtent: 15.0,
                  childrenDelegate: SliverChildBuilderDelegate(
                    (context, index) {
                      ProcessImg imgProcess = imgs[imgs.length - 1 - index];
                      return ImgProcessCardWidget(
                        key: ValueKey(imgProcess.createdAt!.toIso8601String()),
                        imgProcess: imgProcess,
                        onClose: () => AppSer().dbSer().imgDBSer().delete(
                              img: imgProcess,
                            ),
                      );
                    },
                    childCount: imgs.length,
                    findChildIndexCallback: ((key) {
                      final valueKey = key as ValueKey<String>;
                      final val = imgs.indexWhere((element) =>
                          element.createdAt.toIso8601String() ==
                          valueKey.value);
                      return imgs.length - 1 - val;
                    }),
                  ),
                ),
              );
      }),
    );
  }
}
