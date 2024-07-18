import '../../../../providers/app_providers.dart';
import '../../../../providers/imports.dart';
import '../../../../src/repositories/imports.dart';

final search = FutureProviderFamily(
  (ref, title) {
    return ref.watch(searchMove).searchMoves(title: title.toString());
  },
);

final stateData = StateProvider<ResponseModelSearch>(
  (ref) {
    return ResponseModelSearch(results: []);
  },
);

final isSearching = StateProvider<bool>(
  (ref) {
    return false;
  },
);
