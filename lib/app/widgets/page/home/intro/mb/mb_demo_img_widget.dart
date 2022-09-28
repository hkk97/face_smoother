import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';

class MBDemoImgWidget extends StatelessWidget {
  final String imgSrc;
  final double width;
  final String title;
  const MBDemoImgWidget({
    required this.imgSrc,
    required this.width,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EnvImgWidget(
          width: width,
          src: imgSrc,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
