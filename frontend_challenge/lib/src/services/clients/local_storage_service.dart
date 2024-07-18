import 'package:flutter/foundation.dart';
import 'package:frontend_challenge/src/repositories/imports.dart';
import 'package:hive_flutter/adapters.dart';

import '../../models/local_storage_data_model.dart';
import '../interfaces/local_storage_i.dart';

class LocalStorageService implements LocalStorageI {
  @override
  Future put({required LocalStorageDataModel storage}) async {
    final isNotExist = Hive.box(favoriteTable).get(storage.index) == null;
    if (isNotExist) {
      await Hive.box(favoriteTable).put(
        storage.index,
        storage.data!.toMap(),
      );
    }
    return isNotExist;
  }

  @override
  ValueListenable<Box<dynamic>> get({required String table}) {
    final db = Hive.box(table).listenable();

    return db;
  }

  @override
  Future remove({required LocalStorageDataModel storage}) async {
    await Hive.box(favoriteTable).delete(
      storage.index,
    );
  }
}
