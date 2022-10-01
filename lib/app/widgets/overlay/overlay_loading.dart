import 'dart:html';

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
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(error,
            textAlign: TextAlign.center,
           style: TextStyle(
            color: Colors.black, 
            fontWeight: FontWeight.bold,
            ),
            ),
            TextButton(onPressed: (){
              OverlaySer().removeOverlay('errorOverlay');
            }, child: Text('Noticed', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),)),

            ],
          )
        ),
      ),
    ),
    ),
  );
  OverlaySer().createOverlay(context, true, [overlayEntry], ['errorOverlay']);
}
