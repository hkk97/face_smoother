import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/mb/mb_demo_img_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/mb/mb_demo_title_widget.dart';

class DTIntroWidget extends StatefulWidget {
  const DTIntroWidget({super.key});

  @override
  State<DTIntroWidget> createState() => _DTIntroWidget();
}

class _DTIntroWidget extends State<DTIntroWidget> {
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
    final height = MediaQuery.of(context).size.height;
    return height < 850 ? 700 : height;
  }

  double titleHeight(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return height < 850
        ? MediaQuery.of(context).size.height / 6.5
        : MediaQuery.of(context).size.height / 3.5;
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
              top: titleHeight(context),
            ),
            child: Column(
              children: [
                MBDemoTitleWidget(
                  text: "Fast AI automatic Face Smoothing!",
                  showNotifi: showTitleNotifi,
                  onFinished: () => showSubTitleNotifi.value = true,
                  textStyle: const TextStyle(
                    fontSize: 46.0,
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
                  textStyle: const TextStyle(
                    fontSize: 30.0,
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
                  textStyle: const TextStyle(
                    fontSize: 28.0,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
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
                  imgSrc: secondDemoImg.afterImgSrc,
                  width: MediaQuery.of(context).size.width / 3.0,
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
