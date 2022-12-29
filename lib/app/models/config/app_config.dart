import 'package:flutter_web_smoother_plguin_example/app/models/config/base_config.dart';

class DevConfig extends AppConfig {
  @override
  String get host => 'localhost';
  @override
  bool get enableHttps => false;
}

class ProdConfig extends AppConfig {
  @override
  String get host => 'hkk97.github.io/face_smoother/assets/assets/';
  @override
  bool get enableHttps => true;
}
