import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/const/app_enum.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/util/file_util.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/img_process_list_view/img_process_func_bar.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/img_process_list_view/img_process_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/img_process_list_view/img_process_info_widget.dart';

class ImgProcessCardWidget extends StatefulWidget {
  final ProcessImg imgProcess;
  final Function onClose;
  const ImgProcessCardWidget({
    required this.imgProcess,
    required this.onClose,
    super.key,
  });

  @override
  State<ImgProcessCardWidget> createState() => _ImgProcessCardState();
}

class _ImgProcessCardState extends State<ImgProcessCardWidget> {
  late ValueNotifier<SelectedMode> selectedModeNotifi;

  double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 550
        ? width / 25.0
        : width < 750
            ? width / 15.0
            : width < 900
                ? width / 10.0
                : width / 5.5;
  }

  @override
  void initState() {
    selectedModeNotifi = ValueNotifier(SelectedMode.before);
    super.initState();
  }

  @override
  void dispose() {
    selectedModeNotifi.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding(context),
        vertical: 10,
      ),
      child: SizedBox(
        height: 450,
        child: Card(
          elevation: 15.0,
          child: Column(
            children: [
              ImgProcessFuncBar(
                key: UniqueKey(),
                imgProcess: widget.imgProcess,
                selectedModeNotifi: selectedModeNotifi,
                onClose: () => widget.onClose(),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Colors.black45,
              ),
              Expanded(
                child: ValueListenableBuilder<SelectedMode>(
                  valueListenable: selectedModeNotifi,
                  builder: ((context, mode, child) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 5.0,
                      ),
                      child: mode == SelectedMode.fileInfo
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  "File Info",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                ImgProcessInfoWidget(
                                  label: 'File Name',
                                  value: widget.imgProcess.fileName,
                                ),
                                ImgProcessInfoWidget(
                                  label: 'File Size',
                                  value: FileUtil().getFileSizeString(
                                    bytes: widget.imgProcess.fileSize!,
                                  ),
                                ),
                                ImgProcessInfoWidget(
                                  label: 'File Last Modified Date',
                                  value: widget.imgProcess.fileLastModifiedDate
                                      .toString(),
                                ),
                                ImgProcessInfoWidget(
                                  label: 'Created At',
                                  value: widget.imgProcess.createdAt.toString(),
                                ),
                                ImgProcessInfoWidget(
                                  label: 'Updated At',
                                  value: widget.imgProcess.updatedAt.toString(),
                                ),
                              ],
                            )
                          : widget.imgProcess.isValidMedia
                              ? ImgProcessImgWidget(
                                  showOrigin: mode == SelectedMode.before,
                                  beforeImg: widget.imgProcess.beforeImg,
                                  afterImg: widget.imgProcess.afterImg,
                                )
                              : const Center(
                                  child: Text(
                                    "Invalid Files Format",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
