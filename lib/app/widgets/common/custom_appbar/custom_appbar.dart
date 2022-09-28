import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/font/google_font_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/text_status_highlight_widget.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final ValueNotifier<bool> loadScriptNotifi;

  @override
  final Size preferredSize;

  const CustomAppBar({super.key, required this.loadScriptNotifi})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 5.5,
      leading: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => GoRouter.of(context).go('/'),
        child: Padding(
          padding: const EdgeInsets.all(7.5),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  7.5,
                ),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              'Fs',
              textAlign: TextAlign.center,
              style: GoogleFontSer().leckerliOne(
                const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      automaticallyImplyLeading: false,
      titleSpacing: 5.0,
      centerTitle: false,
      title: MediaQuery.of(context).size.width < 500
          ? null
          : GestureDetector(
              onTap: () => GoRouter.of(context).go('/'),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Face',
                      style: GoogleFontSer().leckerliOne(
                        const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: 'Smoother',
                      style: GoogleFontSer().leckerliOne(
                        const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.5,
                          color: Colors.black26,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
      actions: [
        TextStatusHightlightWidget(
          padding: const EdgeInsets.only(left: 5.0, right: 10.0),
          width: 60,
          text: 'OpenCV',
          tooltip: 'Integrated with opencv.js',
          statusNotifi: loadScriptNotifi,
        ),
        TextStatusHightlightWidget(
          padding: const EdgeInsets.only(left: 5.0, right: 10.0),
          width: 70,
          text: 'Fs Filter',
          tooltip: 'Integrated with app.js',
          statusNotifi: loadScriptNotifi,
        ),
      ],
    );
  }
}
