
import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/overlay_ser.dart';

Future<void> showImgProcssErrorOverlay(
    {required BuildContext context}) async {
  final overlayEntry = OverlayEntry(
    builder: (context) => SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black54,
      body: Center(
        child: SizedBox(
          height: 200,
          width: 265,
          child: Card(
            elevation: 15.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Failed to process image with ',
                        style: TextStyle(
              color: Colors.black, 
              ),
                      ),
                      TextSpan(
                        text: 'opencv.js',
                        style: TextStyle(
              color: Colors.black, 
              fontWeight: FontWeight.bold
              ),),
                                    TextSpan(
                        text: ', please use laptop or computer browser instead of mobile browser',
                        style: TextStyle(
              color: Colors.black, 
              ),),
                    ],
                  ),
              ),
                ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: 15.0,
                            horizontal: MediaQuery.of(context).size.width < 350
                                ? 15
                                : 35.0,
                          ),
                        ), onPressed: () { 
                                          OverlaySer().removeOverlay('errorOverlay');
                         },
                        child: Text('Noticed', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,),),),

              ],
            )
          ),
        ),
      ),
    ),
    ),
  );
  OverlaySer().createOverlay(context, true, [overlayEntry], ['errorOverlay']);
}
