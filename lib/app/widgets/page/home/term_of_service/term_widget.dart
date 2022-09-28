import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/term_of_service/term_body_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/term_of_service/term_title_widget.dart';

class TermWidget extends StatelessWidget {
  final String title;
  final List<String> body;
  const TermWidget({
    required this.title,
    required this.body,
    super.key,
  });

  @override
  Widget build(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TermTitleWidget(
          text: title,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: body
              .map(
                (text) => TermBodyWidget(
                  text: text,
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
