import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter_web_smoother_plguin_example/app/app.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/app_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/env_ser.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());
  const String env = String.fromEnvironment(
    'ENV',
    defaultValue: EnvSer.prod,
  );
  await AppSer().init(env: env);
  runApp(const App());
}
