import 'dart:convert';
import 'dart:html';
import 'dart:math';

import 'package:flutter/services.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/env_ser.dart';

class FileUtil {
  static final FileUtil _util = FileUtil._internal();
  factory FileUtil() => _util;
  FileUtil._internal();

  static List<String> allowedTypes = [
    'image/jpeg',
    'image/png',
    'image/jpg',
    'image/webp'
  ];

  bool isAllowedImgType(String type) => allowedTypes.contains(type);

  void downImg(Uint8List uint8list) {
    final base64 = base64Encode(uint8list);
    final anchor = AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$base64");
    anchor.download =
        "Face Smoother Image ${DateTime.now().toIso8601String()}.webp";
    document.body!.append(anchor);
    document.body!.append(anchor);
    document.body!.append(anchor);
    anchor.click();
  }

  Future<int> fileSize(String src) async {
    EnvSer envSer = AppSer().envSer();
    final srcPath = envSer.isDev() ? src : 'assets/$src';
    ByteData byteData = await rootBundle.load(srcPath);
    return byteData.lengthInBytes;
  }

  Future<Uint8List> readRootBundle(String src) async {
    EnvSer envSer = AppSer().envSer();
    final srcPath = envSer.isDev() ? src : 'assets/$src';
    ByteData byteData = await rootBundle.load(srcPath);
    return byteData.buffer.asUint8List();
  }

  String getFileSizeString({required int bytes, int decimals = 3}) {
    const suffixes = ['b', 'kb', 'mb', 'gb', 'tb'];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) + suffixes[i];
  }
}
