import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/overlay_ser.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future<void> showImgProcessLoadingOverlay({
  required BuildContext context,
}) async {
  final overlayEntry = OverlayEntry(
    builder: (context) => SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: LoadingAnimationWidget.dotsTriangle(
          color: Colors.amber,
          size: 200,
        ),
      ),
    )),
  );
  OverlaySer().createOverlay(context, true, [overlayEntry], ['loadingOverlay']);
}
