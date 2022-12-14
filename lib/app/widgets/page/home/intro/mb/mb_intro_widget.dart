import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/mb/mb_demo_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/mb/mb_demo_title_widget.dart';

class MBIntroWidget extends StatefulWidget {
  const MBIntroWidget({super.key});

  @override
  State<MBIntroWidget> createState() => _DTIntroWidget();
}

class _DTIntroWidget extends State<MBIntroWidget> {
  late ValueNotifier<bool> showTitleNotifi;
  late ValueNotifier<bool> showSubTitleNotifi;
  late ValueNotifier<bool> showBodyNotifi;

  @override
  void initState() {
    showTitleNotifi = ValueNotifier(true);
    showSubTitleNotifi = ValueNotifier(false);
    showBodyNotifi = ValueNotifier(false);
    super.initState();
  }

  @override
  void dispose() {
    if (!mounted) {
      showTitleNotifi.dispose();
      showSubTitleNotifi.dispose();
      showBodyNotifi.dispose();
    }
    super.dispose();
  }

  double widgetHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 355
        ? 750
        : width < 450
            ? 800
            : width < 650
                ? 1000
                : 1125;
  }

  double widgetVerticalPadding(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return width < 450
        ? 75
        : width < 650
            ? 85
            : height < 850
                ? MediaQuery.of(context).size.height / 6.5
                : MediaQuery.of(context).size.height / 3.5;
  }

  double titleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 450 ? 28 : 36;
  }

  double subTitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 450 ? 18 : 30;
  }

  double bodyTitleFontSize(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 450 ? 16 : 28;
  }

  double arrowHeight(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 400
        ? 110
        : width < 500
            ? 130
            : 145;
  }

  @override
  Widget build(context) {
    final secondDemoImg = DemoImg.demos()[1];
    return SizedBox(
      height: widgetHeight(context),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: widgetVerticalPadding(context),
            ),
            child: Column(
              children: [
                MBDemoTitleWidget(
                  text: "Fast AI automatic Face Smoothing!",
                  showNotifi: showTitleNotifi,
                  onFinished: () => showSubTitleNotifi.value = true,
                  textStyle: TextStyle(
                    fontSize: titleFontSize(context),
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                MBDemoTitleWidget(
                  text: "Flutter Web integrate with native platform OpenCV",
                  showNotifi: showSubTitleNotifi,
                  onFinished: () => showBodyNotifi.value = true,
                  textStyle: TextStyle(
                    fontSize: subTitleFontSize(context),
                    color: Colors.black54,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 7.5,
                ),
                MBDemoTitleWidget(
                  text: "Dynamic Face Smoother JS Library Injection",
                  showNotifi: showBodyNotifi,
                  onFinished: () async {
                    showTitleNotifi.value = false;
                    showSubTitleNotifi.value = false;
                    showBodyNotifi.value = false;
                    await Future.delayed(
                      const Duration(seconds: 1),
                      () => showTitleNotifi.value = true,
                    );
                  },
                  textStyle: TextStyle(
                    fontSize: bodyTitleFontSize(context),
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          MediaQuery.of(context).size.width < 650
              ? Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MBDemoImgWidget(
                        imgSrc: secondDemoImg.beforeImgSrc,
                        width: MediaQuery.of(context).size.width / 1.50,
                        title: 'Before',
                      ),
                      SizedBox(
                        width: 200,
                        height: arrowHeight(context),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 25.0,
                            horizontal: 50.0,
                          ),
                          child: EnvImgWidget(
                            src: 'arrow_120x120.png',
                          ),
                        ),
                      ),
                      MBDemoImgWidget(
                        imgSrc: secondDemoImg.afterImgSrc,
                        width: MediaQuery.of(context).size.width / 1.50,
                        title: 'After',
                      ),
                    ],
                  ),
                )
              : MediaQuery.of(context).size.width < 1000
                  ? Expanded(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: 200,
                              height: 150,
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.width /
                                        10.0),
                                child: const EnvImgWidget(
                                  src: 'arrow_120x120.png',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                MBDemoImgWidget(
                                  imgSrc: secondDemoImg.beforeImgSrc,
                                  width:
                                      MediaQuery.of(context).size.width / 2.0,
                                  title: 'Before',
                                ),
                                MBDemoImgWidget(
                                  imgSrc: secondDemoImg.afterImgSrc,
                                  width:
                                      MediaQuery.of(context).size.width / 2.0,
                                  title: 'After',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MBDemoImgWidget(
                            imgSrc: secondDemoImg.beforeImgSrc,
                            width: MediaQuery.of(context).size.width / 3,
                            title: 'Before',
                          ),
                          const SizedBox(
                            width: 300,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 65,
                                horizontal: 55,
                              ),
                              child: EnvImgWidget(
                                src: 'arrow_120x120.png',
                              ),
                            ),
                          ),
                          MBDemoImgWidget(
                            imgSrc: secondDemoImg.beforeImgSrc,
                            width: MediaQuery.of(context).size.width / 3,
                            title: 'After',
                          ),
                        ],
                      ),
                    ),
        ],
      ),
    );
  }
}
