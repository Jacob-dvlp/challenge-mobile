import 'imports.dart';

final httpClient = Provider<HttpClientI>(
  (ref) {
    return ClientHttpService();
  },
);

final getMoves = Provider<GetMovesI>(
  (ref) {
    final client = ref.read(httpClient);

    return GetMovesRepository(httpClientI: client);
  },
);

final searchMove = ProviderFamily<SearchMoveI, String>(
  (ref, arg) {
    final client = ref.read(httpClient);

    return SearchMovesRepository(httpClientI: client);
  },
);

final getDetails = ProviderFamily<GetDetailsMoveI, String>(
  (ref, arg) {
    final client = ref.read(httpClient);

    return GetDetailsMoveRepository(httpClientI: client);
  },
);
