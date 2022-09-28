import 'package:flutter/services.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/env_ser.dart';

class DemoImg {
  final String beforeImgSrc;
  final String afterImgSrc;
  DemoImg._({
    required this.beforeImgSrc,
    required this.afterImgSrc,
  });

  static DemoImg interact() => DemoImg._(
        beforeImgSrc: 'demo/demo_6_before.webp',
        afterImgSrc: 'demo/demo_6_after.webp',
      );

  static List<DemoImg> demos() => List.generate(
        5,
        (index) => DemoImg._(
          beforeImgSrc: 'demo/demo_${index + 1}_before.webp',
          afterImgSrc: 'demo/demo_${index + 1}_after.webp',
        ),
      );
}
