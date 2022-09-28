import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/custom_appbar/custom_appbar.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/demo/demo_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/footbar/foot_bar_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/interact_demo/interact_demo_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/intro/intro_widget.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          loadScriptNotifi: AppSer().faceSmoother().loadScriptNotifi,
        ),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: ListView(
            children: [
              DemoWidget(
                onDroppedFile: (processImgElement) => GoRouter.of(context).go(
                  '/image_process',
                  extra: processImgElement,
                ),
              ),
              const IntroWidget(),
              const InteractDemoWidget(),
              FootbarWidget(
                loadScriptNotifi: AppSer().faceSmoother().loadScriptNotifi,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
