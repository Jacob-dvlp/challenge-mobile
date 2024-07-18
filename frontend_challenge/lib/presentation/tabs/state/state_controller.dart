import 'package:frontend_challenge/src/repositories/imports.dart';

import '../../../providers/app_providers.dart';
import '../../../providers/imports.dart';
import '../../../src/models/local_storage_data_model.dart';

final putStorage = ProviderFamily<dynamic, LocalStorageDataModel>(
  (ref, localStorage) {
    return ref.watch(getLocalStorage).put(
          storage: localStorage,
        );
  },
);

final getDataLocalStorage = FutureProvider.autoDispose(
  (ref) {
    return ref.watch(getLocalStorage).get(
          table: favoriteTable,
        );
  },
);

final removeFavorite = ProviderFamily<dynamic, LocalStorageDataModel>(
  (ref, localStorage) {
    return ref.watch(getLocalStorage).remove(storage: localStorage);
  },
);
