import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/const/app_enum.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process_btn.dart';
import 'package:flutter_web_smoother_plguin_example/app/util/file_util.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/btn/hover_underline_widget.dart';

class ImgProcessFuncBar extends StatelessWidget {
  final ProcessImg imgProcess;
  final ValueNotifier<SelectedMode> selectedModeNotifi;
  final Function onClose;

  const ImgProcessFuncBar({
    required this.imgProcess,
    required this.selectedModeNotifi,
    required this.onClose,
    super.key,
  });

  @override
  Widget build(context) {
    final onVertical = MediaQuery.of(context).size.width < 325;
    final onMedium = MediaQuery.of(context).size.width < 550;
    return ValueListenableBuilder<SelectedMode>(
      valueListenable: selectedModeNotifi,
      builder: ((context, mode, child) {
        return Padding(
          padding: EdgeInsets.only(
            top: onVertical || onMedium ? 15 : 20,
            left: onVertical || onMedium ? 10 : 25,
            right: onVertical || onMedium ? 10 : 25,
            bottom: 15.0,
          ),
          child: onVertical
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: ImgProcessBtn.values
                            .map(
                              (value) => HoverUnderlineWidget(
                                text: value.name,
                                isSelect: mode == value.mode,
                                onTap: () =>
                                    selectedModeNotifi.value = value.mode,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        imgProcess.isValidMedia
                            ? GestureDetector(
                                onTap: () => FileUtil().downImg(
                                  imgProcess.afterImg!,
                                ),
                                child: const Tooltip(
                                  message: 'Download filtered image',
                                  padding: EdgeInsets.all(5.5),
                                  child: Icon(
                                    Icons.download,
                                    size: 20.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () => onClose(),
                          child: const Tooltip(
                            message: 'Close',
                            padding: EdgeInsets.all(5.5),
                            child: Icon(
                              Icons.close,
                              size: 20.0,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: ImgProcessBtn.values
                          .map(
                            (value) => HoverUnderlineWidget(
                              text: value.name,
                              isSelect: mode == value.mode,
                              onTap: () =>
                                  selectedModeNotifi.value = value.mode,
                            ),
                          )
                          .toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        imgProcess.isValidMedia
                            ? GestureDetector(
                                onTap: () => FileUtil().downImg(
                                  imgProcess.afterImg!,
                                ),
                                child: Tooltip(
                                  message: 'Download filtered image',
                                  padding: const EdgeInsets.all(5.5),
                                  child: Icon(
                                    Icons.download,
                                    size: onMedium ? 25 : 30.0,
                                    color: Colors.black54,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                        const SizedBox(
                          width: 15,
                        ),
                        GestureDetector(
                          onTap: () => onClose(),
                          child: Tooltip(
                            message: 'Close',
                            padding: const EdgeInsets.all(5.5),
                            child: Icon(
                              Icons.close,
                              size: onMedium ? 25 : 30.0,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
