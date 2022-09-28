import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/privacy/privacy.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/common/custom_appbar/custom_appbar.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/privacy/privacy_body_widget.dart';
import 'package:flutter_web_smoother_plguin_example/app/widgets/page/home/term_of_service/term_title_widget.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  double titleSize(BuildContext context) =>
      MediaQuery.of(context).size.width < 850 ? 40 : 56;

  double termCardPadding(BuildContext context) =>
      MediaQuery.of(context).size.width < 700
          ? MediaQuery.of(context).size.width / 8.5
          : MediaQuery.of(context).size.width < 850
              ? MediaQuery.of(context).size.width / 6.5
              : MediaQuery.of(context).size.width < 1200
                  ? MediaQuery.of(context).size.width / 5.5
                  : MediaQuery.of(context).size.width / 4.0;

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
                child: ListView(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 8.0,
                        bottom: MediaQuery.of(context).size.height / 15.0,
                      ),
                      child: Text(
                        "Privacy Policy",
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
                              children: [
                                const TermTitleWidget(
                                  text: 'Usage of Data',
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: Privacy.values
                                      .map(
                                        (value) => PrivacyBodyWidget(
                                          text: value.title,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
