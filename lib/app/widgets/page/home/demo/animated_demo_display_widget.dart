import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/env_img_widget.dart';

class AnimatedDemoDisplayWidget extends StatefulWidget {
  final String beforeImgSrc;
  final String afterImgSrc;
  const AnimatedDemoDisplayWidget(
      {super.key, required this.beforeImgSrc, required this.afterImgSrc});
  @override
  State<AnimatedDemoDisplayWidget> createState() => _AnimatedDemoDisplayState();
}

class _AnimatedDemoDisplayState extends State<AnimatedDemoDisplayWidget>
    with SingleTickerProviderStateMixin {
  late String imgSrc;
  late Animation animation;
  late AnimationController animationController;

  @override
  void initState() {
    imgSrc = widget.beforeImgSrc;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.elasticIn);
    animationController.addStatusListener((status) async {
      if (status == AnimationStatus.forward) {
      } else if (status == AnimationStatus.reverse) {
      } else if (status == AnimationStatus.completed) {
        if (imgSrc == widget.beforeImgSrc) {
          imgSrc = widget.afterImgSrc;
        } else if (imgSrc == widget.afterImgSrc) {
          imgSrc = widget.beforeImgSrc;
        }
        if (mounted) {
          animationController.reverse();
        }
      } else if (status == AnimationStatus.dismissed) {
        await Future.delayed(const Duration(seconds: 2), () {
          if (mounted) {
            animationController.forward();
          }
        });
      } else {}
    });
    animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        return Opacity(
          opacity: (1 - animationController.value).abs(),
          child: EnvImgWidget(
            src: imgSrc,
            boxFit: BoxFit.fill,
          ),
        );
      },
    );
  }
}
