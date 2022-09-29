import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/term/term.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/custom_appbar/custom_appbar.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/custom_scrollbar/custom_scrollbar.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/term_of_service/term_widget.dart';

class TermOfServicePage extends StatefulWidget {
  const TermOfServicePage({super.key});

  @override
  State<TermOfServicePage> createState() => _TermOfServiceState();
}

class _TermOfServiceState extends State<TermOfServicePage> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  double titleSize(BuildContext context) =>
      MediaQuery.of(context).size.width < 850 ? 40 : 56;

  double termCardPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width < 450
        ? width / 20
        : width < 550
            ? width / 15
            : width < 700
                ? width / 8.5
                : width < 850
                    ? width / 6.5
                    : width < 1200
                        ? width / 5.5
                        : width / 4.0;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
            loadScriptNotifi: AppSer().faceSmoother().loadScriptNotifi),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned.fill(
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        color: const Color.fromRGBO(
                          134,
                          174,
                          216,
                          1.0,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: CustomScrollBar(
                  scrollController: scrollController,
                  child: ListView(
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics(),
                    ),
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 8.0,
                          bottom: MediaQuery.of(context).size.height / 15.0,
                        ),
                        child: Text(
                          "Terms of Service",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: titleSize(context),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: termCardPadding(context),
                          right: termCardPadding(context),
                          bottom: 250.0,
                        ),
                        child: SizedBox(
                          width: 150,
                          child: Card(
                            color: Colors.white,
                            elevation: 15.0,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 50.0,
                                horizontal: 45.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: Term.values
                                    .map(
                                      (value) => TermWidget(
                                        title: value.title,
                                        body: value.body,
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
