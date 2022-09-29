import 'package:flutter/material.dart';

class MBSubtitleWidget extends StatelessWidget {
  const MBSubtitleWidget({super.key});

  double subTitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 400
        ? 25
        : width < 650
            ? 29
            : 36;
  }

  @override
  Widget build(context) {
    final onVertical = MediaQuery.of(context).size.width < 800;
    return onVertical
        ? Center(
            child: Column(
              children: [
                Text(
                  "100% Automatically and ",
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black87,
                    overflow: TextOverflow.fade,
                    fontSize: subTitleFontSize(context),
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Free",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: subTitleFontSize(context),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 1.0,
                      ),
                      Container(
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              2,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "100% Automatically and ",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black87,
                  overflow: TextOverflow.fade,
                  fontSize: 36,
                ),
              ),
              SizedBox(
                width: 80,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Free",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 1.0,
                    ),
                    Container(
                      height: 5,
                      decoration: const BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}
