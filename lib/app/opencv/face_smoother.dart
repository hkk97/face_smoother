import 'dart:async';
import 'dart:html' as html;
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/opencv/face_smoother_plugin.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/overlay/overlay_loading.dart';

class FaceSmoother {
  late ValueNotifier<bool> loadScriptNotifi;
  late ValueNotifier<bool> imgProcessNotifi;
  late FaceSmootherPlugin faceSmootherPlugin;

  Future<void> smoothFilter({
    required html.ImageElement file,
    required BuildContext context,
    required ValueChanged<Uint8List?> imgCallBack,
  }) async {
    try {
      await faceSmootherPlugin.smoothFilter(
        file: file,
        imgProcessNotif: imgProcessNotifi,
        imgCallBack: imgCallBack,
      );
    } catch (e) {
      // await showErrorOverlay(context: context, error: e.toString());
    }
  }

  void init() {
    loadScriptNotifi = ValueNotifier(false);
    imgProcessNotifi = ValueNotifier(false);
    faceSmootherPlugin = FaceSmootherPlugin();
    faceSmootherPlugin.init(loadScriptNotifi: loadScriptNotifi);
  }

  void dispose() {
    loadScriptNotifi.dispose();
    imgProcessNotifi.dispose();
  }
}
