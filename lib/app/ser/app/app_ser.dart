import 'package:flutter_web_smoother_plguin_example/app/opencv/face_smoother.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/db/indexdb_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/env_ser.dart';

class AppSer {
  static final AppSer _ser = AppSer._internal();
  factory AppSer() => _ser;
  AppSer._internal() {
    _envSer = EnvSer();
    _dbSer = IndexedDBSer();
    _faceSmoother = FaceSmoother();
  }

  late EnvSer _envSer;
  late FaceSmoother _faceSmoother;
  late IndexedDBSer _dbSer;

  EnvSer envSer() => _envSer;
  IndexedDBSer dbSer() => _dbSer;
  FaceSmoother faceSmoother() => _faceSmoother;

  Future<void> init({required String env}) async {
    _dbSer.init();
    _envSer.initConfig(env);
    _faceSmoother.init();
  }

  Future<void> dispose() async {
    _dbSer.dispose();
    _faceSmoother.dispose();
  }
}
