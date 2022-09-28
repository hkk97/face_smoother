import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/font/google_font_ser.dart';
import 'package:go_router/go_router.dart';

class FootbarWidget extends StatelessWidget {
  final ValueNotifier<bool> loadScriptNotifi;

  const FootbarWidget({
    required this.loadScriptNotifi,
    super.key,
  });

  @override
  Widget build(context) {
    return SizedBox(
      height: 250,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 85.0),
            child: Divider(
              height: 1,
              thickness: 2,
              color: Colors.black26,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Wrap(
                    children: [
                      GestureDetector(
                        onTap: () => GoRouter.of(context).go('/privacy'),
                        child: const Text(
                          "Privacy Policy",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 20.0,
                      ),
                      GestureDetector(
                        onTap: () => GoRouter.of(context).go('/terms'),
                        child: const Text(
                          "Terms of Service",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Face Smoother',
                      style: GoogleFontSer().leckerliOne(
                        const TextStyle(
                          color: Colors.black38,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Text(
                      'SPOTLIGHT-PLATFORM LIMITED 2022',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
