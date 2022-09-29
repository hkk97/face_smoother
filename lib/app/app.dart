import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/process_img_element.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/home/home_page.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/image_process/image_process_page.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/privacy/privacy_page.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/term_of_service/term_of_service_page.dart';
import 'package:go_router/go_router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final String appTitle = 'Face Smoother';

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (context, state) {
          return const HomePage();
        },
      ),
      GoRoute(
        path: '/terms',
        builder: (context, state) {
          return const TermOfServicePage();
        },
      ),
      GoRoute(
        path: '/privacy',
        builder: (context, state) {
          return const PrivacyPage();
        },
      ),
      GoRoute(
        path: '/image_process',
        builder: (context, state) {
          final processImg = state.extra as ProcessImgElement;
          return ImageProcessPage(
            processImgElement: processImg,
          );
        },
      ),
    ],
  );

  @override
  Widget build(context) {
    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(primaryColor: Colors.white),
      routerConfig: _router,
    );
  }
}
