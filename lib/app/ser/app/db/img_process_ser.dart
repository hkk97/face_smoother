import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_web_smoother_plguin_example/app/models/img_process/img_process.dart';
import 'package:flutter_web_smoother_plguin_example/app/ser/app/db/db_ser.dart';
import 'package:sembast/sembast.dart';

class ImgProcessDBSer extends DBSerClient {
  late ValueNotifier<List<ProcessImg>?> _imgsNotifi;

  ImgProcessDBSer({super.dbSer}) {
    _imgsNotifi = ValueNotifier([]);
  }

  ValueNotifier<List<ProcessImg>?> imgsNotifi() => _imgsNotifi;

  @override
  Future<void> init() async {
    _imgsNotifi = ValueNotifier([]);
    List<ProcessImg>? res = await read();
    if (res != null) {
      _imgsNotifi.value!.addAll(res);
    }
  }

  Future<void> sync() async {
    _imgsNotifi = ValueNotifier([]);
    List<ProcessImg>? res = await read();
    if (res != null) {
      _imgsNotifi.value!.addAll(res);
    }
  }

  Future<void> dispose() async {
    await dbSer!.dispose();
    _imgsNotifi.dispose();
  }

  Future<void> write({required ProcessImg? img}) async {
    if (img != null) {
      await dbSer!.dbstore.add(
        dbSer!.db,
        img.toJson(),
      );
      _imgsNotifi.value!.add(img);
      _imgsNotifi.notifyListeners();
    }
  }

  Future<void> update({required ProcessImg prcessImg}) async {
    await dbSer!.dbstore.update(
      dbSer!.db,
      prcessImg.toJson(),
      finder: Finder(
        filter: Filter.and(
          [
            Filter.equals(
              'createdAt',
              prcessImg.createdAt.toIso8601String(),
            ),
          ],
        ),
      ),
    );
    final updatedIndex = _imgsNotifi.value!.indexWhere(
        (element) => element.createdAt.isAtSameMomentAs(prcessImg.createdAt));
    _imgsNotifi.value![updatedIndex] = prcessImg;
    _imgsNotifi.notifyListeners();
  }

  Future<void> delete({required ProcessImg img}) async {
    await dbSer!.dbstore.delete(
      dbSer!.db,
      finder: Finder(
        filter: Filter.and(
          [Filter.equals('createdAt', img.createdAt.toIso8601String())],
        ),
      ),
    );
    _imgsNotifi.value!.removeWhere(
        (element) => element.createdAt.isAtSameMomentAs(img.createdAt));
    _imgsNotifi.notifyListeners();
  }

  Future<List<ProcessImg>?> read() async {
    List<int> keys = await dbSer!.dbstore.findKeys(dbSer!.db);
    List<RecordSnapshot<int, Map<String, Object?>>?>? resSnapshot =
        await dbSer!.dbstore.records(keys).getSnapshots(dbSer!.db);
    return resSnapshot.isEmpty
        ? null
        : resSnapshot.map((json) => ProcessImg.fromJson(json!.value)).toList();
  }
}
