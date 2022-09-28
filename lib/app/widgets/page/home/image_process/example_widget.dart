import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/demo/demo_img.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_body_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/image_process/example_hint_widget.dart';

class ExampleWidget extends StatelessWidget {
  final bool? inVertical;
  final Function(DemoImg demoImg) onTap;
  const ExampleWidget({
    required this.onTap,
    this.inVertical = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: inVertical!
          ? Column(
              children: [
                const ExampleHintWidget(
                  inVertical: false,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: ExampleBodyWidget(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    onTap: onTap,
                  ),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ExampleHintWidget(),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: ExampleBodyWidget(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    onTap: onTap,
                  ),
                ),
              ],
            ),
    );
  }
}
