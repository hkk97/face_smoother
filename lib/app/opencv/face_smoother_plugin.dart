// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:html';
import 'dart:typed_data';
import 'package:image_whisperer/image_whisperer.dart';
import 'package:js/js.dart';
import 'dart:js' as js;
import 'package:flutter/material.dart';

class FaceSmootherPlugin {
  FaceSmootherPlugin();

  Future<void> init({
    required ValueNotifier<bool> loadScriptNotifi,
  }) async {
    debugPrint("[FlutterWebSmootherPlguinWeb]:[init]");
    bool loadedCVScript =
        html.document.querySelectorAll("script[src='opencv.js']").isNotEmpty;
    if (loadedCVScript) {
      html.ScriptElement appScript = html.ScriptElement()
        ..src = 'assets/js/app.js'
        ..onLoad.listen((event) async {
          if (event.type == 'load') {
            loadScriptNotifi.value = true;
          }
        })
        ..type = 'text/javascript'
        ..defer = true;
      html.document.body!.append(appScript);
    }
  }

  Future<void> smoothFilter({
    required html.ImageElement file,
    required ValueNotifier<bool> imgProcessNotif,
    required ValueChanged<Uint8List?> imgCallBack,
  }) async {
    imgProcessNotif.value = true;
    Uint8List? uint8list;
    html.ImageElement? imgElement =
        html.document.getElementById('img') as html.ImageElement?;
    imgElement = html.ImageElement();
    imgElement.id = 'img';
    imgElement.src = file.src;
    imgElement.width = file.width;
    imgElement.height = file.height;
    html.document.body!.append(imgElement);
    var newCanvas = html.CanvasElement();
    newCanvas.id = 'res';
    html.document.body!.append(newCanvas);
    js.context.callMethod('smoothFilter', [4, 3]);
    html.CanvasElement? resConvas =
        html.document.getElementById('res') as html.CanvasElement?;
    Blob refBlob = await resConvas!.toBlob("image/jpeg", 0.95);
    var blobImage = BlobImage(refBlob, name: 'filteredImg').blob;
    var fileReader = html.FileReader();
    fileReader.readAsArrayBuffer(blobImage);
    fileReader.onLoad.listen((e) {
      var data = fileReader.result;
      uint8list = (data as Uint8List?)!;
      imgCallBack(uint8list);
    });
    imgElement.remove();
    newCanvas.remove();
  }
}
