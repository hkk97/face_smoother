import 'dart:html' as html;
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';

class ProcessImgElement {
  final html.ImageElement? imgElement;
  final ProcessImg processImg;

  ProcessImgElement({
    required this.imgElement,
    required this.processImg,
  });
}
