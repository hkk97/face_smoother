import 'dart:async';

import 'package:flutter_web_smoother_plguin_example/app/ser/app/db/db_ser.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/db/img_process_ser.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast_web/sembast_web.dart';

class IndexedDBSer {
  static final IndexedDBSer _ser = IndexedDBSer._internal();
  factory IndexedDBSer() => _ser;
  IndexedDBSer._internal();

  late DatabaseFactory _dbFactory;
  late ImgProcessDBSer _imgDBSer;
  late StoreRef<int, Map<String, Object?>> _dbStore;

  ImgProcessDBSer imgDBSer() => _imgDBSer;

  FutureOr<DBSer> _dbClient({
    required String name,
    required int dbVersion,
  }) async {
    Database db = await _dbFactory.openDatabase(name, version: dbVersion);
    return DBSer.client(name, dbVersion, db, _dbFactory, _dbStore);
  }

  Future<void> _initDBClient({
    required DBSerClient dbSerClient,
    required String name,
    required int version,
  }) async {
    final dbSer = await _dbClient(name: name, dbVersion: 1);
    dbSerClient.setSer(dbSer);
    dbSerClient.init();
  }

  Future<void> init() async {
    _dbFactory = databaseFactoryWeb;
    _dbStore = intMapStoreFactory.store("records");
    _imgDBSer = ImgProcessDBSer();
    await _initDBClient(dbSerClient: _imgDBSer, name: 'imgDBSer', version: 2);
  }

  Future<void> dispose() async {
    _imgDBSer.dispose();
  }
}
