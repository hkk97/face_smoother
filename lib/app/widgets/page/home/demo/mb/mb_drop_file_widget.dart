import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/drop_zone_widget.dart';

class MBDropFileWidget extends StatelessWidget {
  final ValueChanged<ProcessImgElement> onDroppedFile;

  const MBDropFileWidget({
    required this.onDroppedFile,
    super.key,
  });

  @override
  Widget build(context) {
    final onVertical = MediaQuery.of(context).size.width < 650;
    return onVertical
        ? SizedBox(
            height: 380,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width / 11.0,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 75,
                    child: EnvImgWidget(
                      src: 'arrow_120x120.png',
                    ),
                  ),
                  const SizedBox(
                    height: 22.5,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width > 500
                            ? MediaQuery.of(context).size.width / 11.0
                            : 0,
                      ),
                      child: SizedBox(
                        height: 325,
                        child: DropFileWidget(
                          onDroppedFile: (processImg) async => onDroppedFile(
                            processImg,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : SizedBox(
            height: 450,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width < 850
                    ? MediaQuery.of(context).size.width / 18
                    : MediaQuery.of(context).size.width / 8,
              ),
              child: Row(
                children: [
                  const SizedBox(
                    child: EnvImgWidget(
                      src: 'arrow_120x120.png',
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width / 15.0,
                      ),
                      child: SizedBox(
                        height: 350,
                        child: DropFileWidget(
                          onDroppedFile: (processImg) async => onDroppedFile(
                            processImg,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
