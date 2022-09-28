import 'package:flutter/material.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/home/home_page.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/privacy/privacy_page.dart';
import 'package:flutter_web_smoother_plguin_example/app/page/term_of_service/term_of_service_page.dart';
import 'package:go_router/go_router.dart';

class AppMixin extends StatelessWidget {
  AppMixin({super.key});
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
        path: '/tos',
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
    ],
  );

  @override
  Widget build(context) {
    return MaterialApp.router(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      routerConfig: _router,
    );
  }
}
