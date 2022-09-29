import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/overlay_ser.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

Future<void> showOverlayLoading({
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

Future<void> showErrorOverlay(
    {required BuildContext context, required String error}) async {
  final overlayEntry = OverlayEntry(
    builder: (context) => SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: Text(
          error,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    )),
  );
  OverlaySer().createOverlay(context, true, [overlayEntry], ['loadingOverlay']);
}
