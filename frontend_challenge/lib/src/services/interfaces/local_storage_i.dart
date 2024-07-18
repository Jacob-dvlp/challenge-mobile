import 'package:flutter/foundation.dart';
import 'package:frontend_challenge/src/models/local_storage_data_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract interface class LocalStorageI {
  ValueListenable<Box<dynamic>> get({required String table});
  Future put({
    required LocalStorageDataModel storage,
  });
  Future remove({
    required LocalStorageDataModel storage,
  });
}
