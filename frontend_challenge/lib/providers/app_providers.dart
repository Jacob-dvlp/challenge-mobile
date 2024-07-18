import 'package:frontend_challenge/src/services/clients/local_storage_service.dart';

import '../src/services/interfaces/local_storage_i.dart';
import 'imports.dart';

final httpClient = Provider<HttpClientI>(
  (ref) {
    return ClientHttpService();
  },
);

final getLocalStorage = Provider<LocalStorageI>(
  (
    ref,
  ) {
    return LocalStorageService();
  },
);

final getMoves = Provider<GetMovesI>(
  (ref) {
    final client = ref.read(httpClient);

    return GetMovesRepository(
      httpClientI: client,
    );
  },
);

final searchMove = Provider<SearchMoveI>(
  (ref) {
    final client = ref.read(httpClient);

    return SearchMovesRepository(
      httpClientI: client,
    );
  },
);

final getDetails = Provider<GetDetailsMoveI>(
  (
    ref,
  ) {
    final client = ref.read(httpClient);

    return GetDetailsMoveRepository(
      httpClientI: client,
    );
  },
);
